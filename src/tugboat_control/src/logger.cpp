/*
The logger records important data, and saves to file
*/

#include "ros/ros.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/BoatPose.h"

#include <iostream>

tugboat_control::BoatPose Pose;
tugboat_control::BoatPose lastPose;
tugboat_control::Waypoint Waypoint;
double v;


void waypCallback(const tugboat_control::Waypoint::ConstPtr& wayp_in)
{
   Waypoint = *wayp_in;
}

void shipPoseCallback(const tugboat_control::BoatPose::ConstPtr& pose_in)
{
  lastPose = Pose;
  Pose = *pose_in;
  v = 0.8 * v + 0.2 * sqrt(pow(Pose.x - lastPose.x, 2) + pow(Pose.y - lastPose.y,2) ); //Some sort of low-pass
}

void publishLogMessage()
{
  ROS_INFO("%f,%f,%f,%f,%f,%f,%f,%f \n", Pose.x, Pose.y, Pose.o, v, Waypoint.x, Waypoint.y, Waypoint.o, Waypoint.v); //Log shipPose vs shipWaypoint, anything else?
}

int main(int argc, char **argv)
{

  ros::init(argc, argv, "logger");

  ros::NodeHandle n;

  ros::Rate loop_rate(1);

  ros::Subscriber shipPose_sub = n.subscribe("shipPose", 1, shipPoseCallback);
  ros::Subscriber wayp_sub = n.subscribe("shipWaypoint", 1, waypCallback);


  ROS_INFO("Pose.x, Pose.y, Pose.o, v, Waypoint.x, Waypoint.y, Waypoint.o, Waypoint.v");
  while(ros::ok())
  {
    loop_rate.sleep();
    ros::spinOnce();
    publishLogMessage();
  }

  return 0;
}