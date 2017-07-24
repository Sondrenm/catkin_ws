/*
This module is used to debug other modules by publishing on relevant topics.
*/


#include "ros/ros.h"
#include "std_msgs/String.h"
#include "tugboat_control/Thrust.h"
#include "tugboat_control/TugSetpoints.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/ClearWaypoint.h"
#include "std_msgs/UInt8MultiArray.h"

#include <iostream>
#include <sstream>
#include <unistd.h>

std_msgs::UInt8MultiArray waypTugs;

void waypClearCallback(const tugboat_control::ClearWaypoint::ConstPtr& msg)
{
  for (int i = 0; i < waypTugs.data.size(); ++i)
  {
    if(waypTugs.data[i] == msg->tugID){
      waypTugs.data.erase(waypTugs.data.begin() + i);
    }
  }  
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "talker");

  ros::NodeHandle n;
  ros::Rate loop_rate(1);

  //Publishers
  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
  ros::Publisher cmd_pub = n.advertise<tugboat_control::Thrust>("thrust", 1000);
	ros::Publisher ctrl_pub = n.advertise<tugboat_control::TugSetpoints>("control", 1000);
  ros::Publisher pose_pub = n.advertise<tugboat_control::BoatPose>("pose", 10);
  ros::Publisher wayp_pub = n.advertise<tugboat_control::Waypoint>("waypoint", 10);
  ros::Publisher shipWayp_pub = n.advertise<tugboat_control::Waypoint>("shipWaypoint", 10);
  ros::Publisher waypReq_pub = n.advertise<tugboat_control::Waypoint>("waypointRequest", 10);
  ros::Publisher ctrlTugs_pub = n.advertise<std_msgs::UInt8MultiArray>("ctrlTugs", 1); //List of tugboats controlled by Ship Control
  ros::Publisher waypTugs_pub = n.advertise<std_msgs::UInt8MultiArray>("waypTugs", 1); //List of tugboats controlled by Waypoint manager

  ros::Subscriber waypClear_sub = n.subscribe("clearWaypoint", 100, waypClearCallback);

  //Messages
  std_msgs::String msg;
  tugboat_control::Thrust cmd;
  tugboat_control::Waypoint wayp;
  tugboat_control::Waypoint waypReq;
  tugboat_control::TugSetpoints ctrl;
  tugboat_control::BoatPose pose;
  std_msgs::UInt8MultiArray ctrlTugs;

  waypTugs.data.push_back(3);
  waypTugs.data.push_back(4);

  int count = 0;

  while (ros::ok())
  {
    count++;
    waypTugs_pub.publish(waypTugs);
    /*
    std::stringstream ss;
    ss << "hello world " << count;
    msg.data = ss.str();

    ROS_INFO("%s", msg.data.c_str());
    chatter_pub.publish(msg);
    */

    //For demonstrating collision-avoidance
    waypReq.ID = 3;
    waypReq.x = 2.8;
    waypReq.y = 1.7;
    waypReq_pub.publish(waypReq);


    waypReq.ID = 4;
    waypReq.x = 2.8;
    waypReq.y = 1.3;
    waypReq_pub.publish(waypReq);
    /*
    cmd.ID = 1;
    cmd.thrust = 0;
    cmd.ccwturn = 0;
    cmd_pub.publish(cmd);
    */
    /*
    ctrlTugs_pub.publish(ctrlTugs);

    wayp.ID = 2;
    if(count < 20)
    {
      wayp.x = 1;
      wayp.y = 1;
    }
    else if (count < 40)
    {
      wayp.x = 2;
      wayp.y = 2;
    }
    else 
    {
      count = 0;
    }
    wayp.v = 0.1;
    wayp.o = 4;
    wayp_pub.publish(wayp);
    
    //wayp.ID = 4;
    //wayp_pub.publish(wayp);
    */

    /*
    ctrl.ID = 3;
    ctrl.o = 0;
    ctrl.force = 5;
    ctrl_pub.publish(ctrl);
    */

    /*
    pose.ID = 0;
    pose.o = 0;
    pose.x = 0;
    pose.y = 0;
    pose_pub.publish(pose);
    */

    //std::cout << (int)cmd.ID << (int)cmd.thrust << (int)cmd.ccwturn << "\n";

    ros::spinOnce();
    loop_rate.sleep();
  }


  return 0;
}