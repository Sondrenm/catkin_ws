//TugController.cpp

#include "ros/ros.h"
#include "tugboat_control/Thrust.h"
#include "tugboat_control/TugSetpoints.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/PushingForce.h"
#include "std_msgs/Bool.h"
#include "std_msgs/UInt8.h"

#include "/usr/local/include/PID_cpp/pid.h"
#include <string>
#include <iostream>
#include <sstream>
#include <unistd.h>
#include <cmath>

#define NO_CONTROL 0
#define CTRL 1
#define WAYP 2
#define ACCEPTABLE_ANGLE_ERROR 0.5 
// 0.5 rad = 29 degrees
#define ACCEPTABLE_DIST_ERROR 0.0 
// 0 cm from waypoint is considered OK
#define TIMEOUT_TIME 1000 //ms 

#define dt                  0.1 
//Controller timestep in seconds
#define output_max          100 
//Output is measured in %
#define output_min          -100
#define circular            true
#define noncircular         false

#define ctrl_ccwturn_Kp      15
#define ctrl_ccwturn_Kd      30
#define ctrl_ccwturn_Ki      0

#define PUSHING_CONTROLLER_ENABLED false
#define FORCE_TO_THRUST 100.0
#define ctrl_thrust_Kp      10
#define ctrl_thrust_Kd      10
#define ctrl_thrust_Ki      0

#define wayp_ccwturn_Kp      15
#define wayp_ccwturn_Kd      30
#define wayp_ccwturn_Ki      0

//Temporary disabled
#define SPEED_CONTROLLER_ENABLED false
#define wayp_thrust_Kp      1000
#define wayp_thrust_Kd      100
#define wayp_thrust_Ki      0

PID ctrl_ccwturnPID = PID(dt, output_max, 
  output_min, ctrl_ccwturn_Kp, ctrl_ccwturn_Kd,
   ctrl_ccwturn_Ki, circular);
PID ctrl_thrustPID = PID(dt, output_max, 0,
 ctrl_thrust_Kp, ctrl_thrust_Kd, ctrl_thrust_Ki,
  noncircular);

PID wayp_ccwturnPID = PID(dt, output_max, output_min,
 wayp_ccwturn_Kp, wayp_ccwturn_Kd, wayp_ccwturn_Ki,
  circular);
PID wayp_thrustPID = PID(dt, 50, 0, wayp_thrust_Kp,
 wayp_thrust_Kd, wayp_thrust_Ki, noncircular);

tugboat_control::BoatPose pose;
tugboat_control::BoatPose lastPose;
tugboat_control::Waypoint wayp;
tugboat_control::Thrust cmd;
tugboat_control::PushingForce push;
tugboat_control::TugSetpoints ctrl;

uint8_t id; //Passed as an argument. Default value 0
int controlMode = NO_CONTROL;
bool timeout = false;
long lastPoseTime = 0;
double v;

void resetController()
{
  if(controlMode == CTRL)
  {
    ctrl_ccwturnPID.resetPID();
    ctrl_thrustPID.resetPID();
  }
  else if (controlMode == WAYP)
  {
    wayp_ccwturnPID.resetPID();
    wayp_thrustPID.resetPID();
  }
}

void poseCallback(const tugboat_control::BoatPose::
  ConstPtr& pose_in)
{
  if(pose_in->ID == id){
    pose = *pose_in;
    long thisPoseTime = PIDmsNow();

    if(controlMode == WAYP && SPEED_CONTROLLER_ENABLED){
     //need to update speed also
      double dx = pose.x - lastPose.x;
      double dy = pose.y - lastPose.y;
      double directionOfTravel = atan2(dy, dx);
      double angleDifference = 
      PIDnormalizeAngle(pose.o - directionOfTravel);

      double timechange = thisPoseTime - lastPoseTime;
      v = sqrt(dx*dx + dy*dy) * cos(angleDifference) 
      / (timechange/1000);
    }

  lastPoseTime = thisPoseTime;
  lastPose = pose;
  }
}

void pushCallback(const tugboat_control::PushingForce::
  ConstPtr& push_in)
{
  if(push_in->ID == id){
    push = *push_in;
  }
}

void waypCallback(const tugboat_control::Waypoint::
  ConstPtr& wayp_in)
{
  if(wayp_in->ID == id){
    if(controlMode != WAYP){
      std::cout << "Enter Waypoint Mode\n";
      resetController();
      controlMode = WAYP;
    }
    wayp = *wayp_in;
  }
}

void ctrlCallback(const tugboat_control::TugSetpoints::
  ConstPtr& ctrl_in)
{
  if(ctrl_in->ID == id){
    if(controlMode != CTRL){
      std::cout << "Enter Control Mode\n";
      resetController();
      controlMode = CTRL;
    }
    ctrl = *ctrl_in;
  }
}

void computeControl(bool mode, ros::Publisher stress_pub)
{
  long timeSinceLastPoseMeasurement = PIDmsNow() 
  - lastPoseTime;
  if( timeSinceLastPoseMeasurement < TIMEOUT_TIME)
  {
    if(controlMode == WAYP)
    {
      double dist = sqrt(pow(pose.x - wayp.x, 2) 
        + pow(pose.y - wayp.y, 2));
      double oSet = atan2(wayp.y - pose.y, wayp.x 
        - pose.x);
      double oErr = PIDnormalizeAngle(oSet - pose.o);

      if(std::abs(oErr) < ACCEPTABLE_ANGLE_ERROR 
        && dist > ACCEPTABLE_DIST_ERROR)
      {
        if(SPEED_CONTROLLER_ENABLED){        
          cmd.thrust = (int8_t)wayp_thrustPID.calculate(
            wayp.v, v );
        }
        else if(dist < 1){
          cmd.thrust = (int8_t)(dist * 40 + 10);
        }
        else {
          cmd.thrust = 50;          
        }
      } 
      else 
      {
        cmd.thrust = 0;
      }
      cmd.ccwturn = (int8_t)wayp_ccwturnPID.calculate(
        oSet, pose.o);
      return;
    }

    else if(controlMode == CTRL)
    {
      cmd.ccwturn = (int8_t)ctrl_ccwturnPID.calculate(
        ctrl.o, pose.o);

      double oErrCtrl = PIDnormalizeAngle(
        ctrl.o - pose.o);
      if( std::abs( oErrCtrl ) < ACCEPTABLE_ANGLE_ERROR )
      {
        if(PUSHING_CONTROLLER_ENABLED)
        { //Feedforward + feedback
          cmd.thrust = (int8_t)( ctrl.force 
            * FORCE_TO_THRUST + ctrl_thrustPID.calculate(
              ctrl.force, push.force) );
        }
        else
        { //Only feedforward
          cmd.thrust = (int8_t)(FORCE_TO_THRUST * 
            ctrl.force);
        }
      }
      //For stress-based tugboat managing
      std_msgs::Bool stress;
      if(cmd.thrust > 60)
      {
        stress.data = true;
        stress_pub.publish(stress);
      } 
      else if(cmd.thrust < 20)
      {
        stress.data = false;
        stress_pub.publish(stress);
      }
      return;
    }
  }
  //More than TIMEOUT_TIME ms since last pos update, 
  //or no control mode - shut down tugboat
  cmd.thrust = 0;
  cmd.ccwturn = 0;
  resetController();
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "tug");
  ros::NodeHandle n;
  ros::Subscriber pose_sub = n.subscribe(
    "pose", 100, poseCallback);
  ros::Subscriber ctrl_sub = n.subscribe(
    "control", 100, ctrlCallback);
  ros::Subscriber wayp_sub = n.subscribe(
    "waypoint", 100, waypCallback);
  ros::Subscriber push_sub = n.subscribe(
    "pushingForce", 100, pushCallback);

  ros::Publisher cmd_pub = n.advertise<tugboat_control::
  Thrust>("thrust", 100);
  ros::Publisher stress_pub = n.advertise<std_msgs::
  Bool>("distress", 100);
  ros::Publisher startup_pub = n.advertise<std_msgs::
  UInt8>("startup", 100);
  
  ros::Rate loop_rate(10);

  ros::NodeHandle pnh("~");
  double ID;
  if(pnh.getParam("ID", ID)) {
    id = (uint8_t)ID;
  }
  else {
    id = 1;
  }

  cmd.ID = id;
  std_msgs::UInt8 idMsg;
  idMsg.data = id;
  if(ros::ok())
  { 
    ros::Duration(0.5).sleep();
    startup_pub.publish(idMsg);
    ros::spinOnce();
  }

  std::cout << "TugController initialized 
  successfully with id " << (int)id << "\n";

  while (ros::ok())
  {
    ros::spinOnce();
    computeControl(controlMode, stress_pub);
    cmd_pub.publish(cmd);
    loop_rate.sleep();
  }

  return 0;
}
