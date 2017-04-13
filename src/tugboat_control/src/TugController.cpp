// Controls one tugboat, indicated by "id" tag,
// which is passed as an input argument when running the code

#include "ros/ros.h"
#include "tugboat_control/Thrust.h"
#include "tugboat_control/TugSetpoints.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/BoatStatus.h"

#include "/usr/local/include/PID_cpp/pid.h"

#include <iostream>
#include <sstream>
#include <unistd.h>
#include <math.h>


uint8_t id = 1; //Should be passed as an argument, fix later
bool controlMode;
#define CTRL 1
#define WAYP 0

tugboat_control::BoatStatus meas;

#define pi                  3.1416
#define dt                  0.1 //Controller timestep in seconds
#define output_max          100 //Output is measured in %
#define output_min          -100
#define circular            true
#define noncircular         false

#define ctrl_cwturn_Kp      30
#define ctrl_cwturn_Kd      0
#define ctrl_cwturn_Ki      0

#define ctrl_thrust_Kp      1
#define ctrl_thrust_Kd      0
#define ctrl_thrust_Ki      0

#define wayp_cwturn_Kp      30
#define wayp_cwturn_Kd      0
#define wayp_cwturn_Ki      0

#define wayp_thrust_Kp      1
#define wayp_thrust_Kd      0
#define wayp_thrust_Ki      0

class ctrlCallbackClass
{
public:
  ctrlCallbackClass()
  {
    cmd_pub = n.advertise<tugboat_control::Thrust>("thrust", 1);
    ctrl_sub = n.subscribe("control", 100, &ctrlCallbackClass::callback, this);
    cmd.ID = id;
  }

  void callback(const tugboat_control::TugSetpoints& ctrl)
  {
    if(id == ctrl.ID){
      if(controlMode != CTRL)
      {
        ctrl_cwturnPID.resetPID();
        ctrl_thrustPID.resetPID();
        controlMode = CTRL;
      }
      cmd.thrust = (int8_t)ctrl_thrustPID.calculate(ctrl.force, meas.force);
      cmd.cwturn = (int8_t)ctrl_cwturnPID.calculate(ctrl.o, meas.o);

      cmd_pub.publish(cmd);
    }
  }

private:
  ros::NodeHandle n; 
  ros::Publisher cmd_pub;
  ros::Subscriber ctrl_sub;  
  tugboat_control::Thrust cmd;

  PID ctrl_cwturnPID = PID(dt, output_max, output_min, ctrl_cwturn_Kp, ctrl_cwturn_Kd, ctrl_cwturn_Ki, circular);
  PID ctrl_thrustPID = PID(dt, output_max, output_min, ctrl_thrust_Kp, ctrl_thrust_Kd, ctrl_thrust_Ki, noncircular);
};


class waypointCallbackClass
{
public:
  waypointCallbackClass()
  {
    cmd_pub = n.advertise<tugboat_control::Thrust>("thrust", 1);
    wayp_sub = n.subscribe("waypoint", 100, &waypointCallbackClass::callback, this);
    cmd.ID = id;
  }

  void callback(const tugboat_control::Waypoint& wayp)
  {
    if(id == wayp.ID){
      if(controlMode != WAYP)
      {
        wayp_cwturnPID.resetPID();
        wayp_thrustPID.resetPID();
        controlMode = WAYP;
      }
      //TODO: make better speed estimator
      velocity = sqrt(pow(wayp.x-lastx, 2) + pow(wayp.y - lasty, 2)) / dt;
      o = atan2(wayp.y - lasty, wayp.x - lastx);

      lastx = wayp.x;
      lasty = wayp.y;
      //TODO: if(abs(o-meas.o (adjusted for +-pi)) < some angle){
      cmd.thrust = (int8_t)wayp_thrustPID.calculate(wayp.v, velocity);
      //} else {thrust = 0;}
      cmd.cwturn = (int8_t)wayp_cwturnPID.calculate(o, meas.o);

      cmd_pub.publish(cmd);
    }
  }

private:
  ros::NodeHandle n; 
  ros::Publisher cmd_pub;
  ros::Subscriber wayp_sub;
  tugboat_control::Thrust cmd;

  double velocity;
  double o;
  double lastx;
  double lasty;

  PID wayp_cwturnPID = PID(dt, output_max, output_min, wayp_cwturn_Kp, wayp_cwturn_Kd, wayp_cwturn_Ki, circular);
  PID wayp_thrustPID = PID(dt, output_max, output_min, wayp_thrust_Kp, wayp_thrust_Kd, wayp_thrust_Ki, noncircular);

};

void measurementCallback(const tugboat_control::BoatStatus& status)
{
  if(id == meas.ID){
    meas = status;
  }
}

int main(int argc, char **argv)
{
  //id = idIn //Passed as an argument somehow

  ros::init(argc, argv, "tug");
  ros::NodeHandle node;
  ros::Subscriber meas_sub = node.subscribe("status", 1000, measurementCallback);

  ctrlCallbackClass ctrlCallback;
  waypointCallbackClass waypointCallback;

  ros::Rate loop_rate(10);

  while (ros::ok())
  {
    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}