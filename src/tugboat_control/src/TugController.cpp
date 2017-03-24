#include "ros/ros.h"
#include "std_msgs/String.h"
#include "tugboat_control/Thrust.h"
#include "tugboat_control/TugSetpoints.h"
#include "tugboat_control/Waypoint.h"

#include <iostream>
#include <sstream>
#include <unistd.h>
#include </usr/local/include/PID_cpp/pid.h>

static uint8_t id = 1; //Should be passed as an argument

class ctrlCallbackClass
{
public:
  ctrlCallbackClass()
  {
    //Topic you want to publish
    cmd_pub = n.advertise<tugboat_control::Thrust>("thrust", 1);

    //Topic you want to subscribe
    ctrl_sub = n.subscribe("control", 100, &ctrlCallbackClass::callback, this);

    cmd.ID = id;
    // PID::PID( double dt, double max, double min, double Kp, double Kd, double Ki )
    hdgPID = PID(dt, hdg_max, hdg_min, hdg_Kp, hdg_Kd, hdg_Ki);
    forcePID = PID();
  }

  void callback(const tugboat_control::TugSetpoints& ctrl)
  {
    if(id == ctrl.ID){
      //ctrl_loop stuff

      /*
        1. clear waypoint controller: waypClear(){if(active){clear}}; ctrlActivate();
        Eller: global: MODE: If(MODE != ctrl){MODE = ctrl; clearCtrl()}
        2. Calculate PID-stuff
        3. publish cmd
      */
      cmd.cwturn = (int8_t)ctrl.orientation;
      cmd.thrust = (int8_t)ctrl.pushingForce;

      cmd_pub.publish(cmd);
    }
  }

private:
  ros::NodeHandle n; 
  ros::Publisher cmd_pub;
  ros::Subscriber ctrl_sub;  
  tugboat_control::Thrust cmd;

  PID hdgPID;
  double dt = 0.1;
  double hdg_max = ;
  double hdg_min;
  double hdg_Kp;
  double hdg_Kd;
  double hdg_Ki;
  double hdg_pre_error;
  double hdg_integral;

  PID forcePID;
  double force_max;
  double force_min;
  double force_Kp;
  double force_Kd;
  double force_Ki;
  double force_pre_error;
  double force_integral;

  //clearCtrl(){}

};


class waypointCallbackClass
{
public:
  waypointCallbackClass()
  {
    //Topic you want to publish
    cmd_pub = n.advertise<tugboat_control::Thrust>("thrust", 1);

    //Topic you want to subscribe
    wayp_sub = n.subscribe("waypoint", 100, &waypointCallbackClass::callback, this);
  }

  void callback(const tugboat_control::Waypoint& wayp)
  {
    if(id == wayp.ID){
      //ctrl_loop stuff
      tugboat_control::Thrust cmd;
      cmd.ID = wayp.ID;
      cmd.cwturn = (int8_t)0;
      cmd.thrust = (int8_t)1; //Based on input

      cmd_pub.publish(cmd);
    }
  }

private:
  ros::NodeHandle n; 
  ros::Publisher cmd_pub;
  ros::Subscriber wayp_sub;

};
/*

void waypointCallback(const tugboat_control::Waypoint::ConstPtr& waypoint)
{
  std::cout << "Got thrust\n";
  if(id == ctrl.ID){

    //waypont control stuff
  }
}
*/
/*
  void controlCallback(const tugboat_control::TugSetpoints& ctrl)
  {
    std::cout << "Got thrust\n";
    if(id == ctrl.ID){
      //ctrl_loop stuff
      tugboat_control::Thrust cmd;
      cmd.ID = ctrl.ID;
      cmd.cwturn = (int8_t)ctrl.orientation;
      cmd.thrust = (int8_t)ctrl.pushingForce;

      cmd_pub.publish(cmd);
    }
  }
*/
int main(int argc, char **argv)
{
  //id = idIn //Passed as an argument somehow

  ros::init(argc, argv, "tug");
  //ros::NodeHandle n;

  //ros::Subscriber ctrl_sub = n.subscribe("control", 1000, controlCallback);
  //ros::Subscriber wayp_sub = n.subscribe("waypoint", 1000, waypointCallback);
  //ros::Publisher cmd_pub = n.advertise<tugboat_control::Thrust>("thrust", 1000);
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