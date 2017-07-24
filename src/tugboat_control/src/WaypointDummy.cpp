/* WaypointManager.cpp
 This module is a placeholder for Cox' path-planning 
 algorithms, but is included to show the interface and
  the general functionality. Not that this module 
  has no path-planning capabilities.*/
#include "ros/ros.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/ClearWaypoint.h"
#include "std_msgs/UInt8MultiArray.h"

#include <iostream>
#include <sstream>
#include <unistd.h>
#include <vector>

#define SHIP_ID 0 
#define ACCEPTABLE_DIST_ERROR 0.3 //30 cm is ok for now

tugboat_control::BoatPose shipPose;
tugboat_control::Waypoint shipWaypoint;

//tugPoses and waypTugIDs have the same indexes for 
//the same tugboats
std_msgs::UInt8MultiArray waypTugIDs;
std::vector<tugboat_control::BoatPose> tugPoses; 
std::vector<tugboat_control::Waypoint> tugWaypoints; 
//ID = orderID

void shipPoseCallback(const tugboat_control::BoatPose::
  ConstPtr& pose_in)
{ //Not used in dummy
  shipPose = *pose_in;
}

void tugPoseCallback(const tugboat_control::BoatPose::
  ConstPtr& pose_in)
{
  for (int tug = 0; tug < waypTugIDs.data.size(); ++tug)
  {
    if(pose_in->ID == waypTugIDs.data[tug]){
        tugPoses[tug] = *pose_in;
      return;
    }
  }
}

void waypTugsCallback(const std_msgs::UInt8MultiArray::
  ConstPtr& tugsIn)
{
  std::vector<tugboat_control::BoatPose> newPoses; 

  waypTugIDs = *tugsIn;
  for (int ID = 0; ID < waypTugIDs.data.size(); ++ID)
  {
    for (int pose = 0; pose < tugPoses.size(); ++pose)
    {
      if(tugPoses[pose].ID == waypTugIDs.data[ID])
      {
        newPoses.push_back(tugPoses[pose]);
        break;
      }
    }
    if(newPoses.size() <= ID)
    { //No element added above, because no Pose is in 
      //record
      tugboat_control::BoatPose blankPose;
      blankPose.ID = waypTugIDs.data[ID];
      blankPose.x = -10;
      blankPose.y = 0;
      blankPose.o = 0;
      newPoses.push_back(blankPose);
    }
  }
  tugPoses = newPoses;
}

void waypReqCallback(const tugboat_control::Waypoint::
  ConstPtr& waypIn)
{
  for (int wayp = 0; wayp < tugWaypoints.size(); ++wayp)
  {
    if(tugWaypoints[wayp].ID == waypIn->ID){
      tugWaypoints[wayp] = *waypIn;
      return;
    }
  }
  tugWaypoints.push_back(*waypIn);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "dummyWaypoint");

  ros::NodeHandle n;
  ros::Publisher clearWayp_pub = n.advertise<
  tugboat_control::ClearWaypoint>("clearWaypoint", 1000);
  ros::Publisher tugWayp_pub = n.advertise<
  tugboat_control::Waypoint>("waypoint", 10);
  ros::Publisher shipWayp_pub = n.advertise<
  tugboat_control::Waypoint>("shipWaypoint", 10);
  ros::Subscriber shipPose_sub = n.subscribe(
    "shipPose", 100, shipPoseCallback);
  ros::Subscriber tugPose_sub = n.subscribe(
    "pose", 100, tugPoseCallback);
  ros::Subscriber waypTugs_sub = n.subscribe(
    "waypTugs", 100, waypTugsCallback);
  ros::Subscriber waypReq_sub = n.subscribe(
    "waypointRequest", 100, waypReqCallback);
 
  ros::Rate loop_rate(1);

  shipWaypoint.ID = SHIP_ID;
  shipWaypoint.x = 1;
  shipWaypoint.y = 1;
  shipWaypoint.o = 0;
  shipWaypoint.v = 0.05;

  std::cout << "Waypoint Dummy node initialized 
  successfully\n";
  while (ros::ok())
  {    
    ros::spinOnce();
    for (int waypoint = 0; waypoint < 
      tugWaypoints.size(); ++waypoint)
    {
      for (int tug = 0; tug < waypTugIDs.data.size();
       ++tug)
      {
        if(sqrt( pow(tugWaypoints[waypoint].x - 
          tugPoses[tug].x, 2) + pow(tugWaypoints[
            waypoint].y - tugPoses[tug].y, 2) ) < 
          ACCEPTABLE_DIST_ERROR)
        {
          tugboat_control::ClearWaypoint msg;
          msg.tugID = waypTugIDs.data[tug];
          msg.orderID = tugWaypoints[waypoint].ID;
          clearWayp_pub.publish(msg);

          std::cout << "Clearing waypoint with id " << 
          (int)msg.orderID << "\n";

          tugWaypoints.erase(tugWaypoints.begin() + 
            waypoint);
          waypTugIDs.data.erase(waypTugIDs.data.begin()
           + tug);
          tugPoses.erase(tugPoses.begin() + tug);
          break;
        }
      }
    }
    //Publish all remaining waypoints
    shipWayp_pub.publish(shipWaypoint);

    tugboat_control::Waypoint tempWayp;
    for (int tug = 0; tug < waypTugIDs.data.size();
     ++tug)
    {
      if (tug < tugWaypoints.size())
      {
        tempWayp = tugWaypoints[tug];
        std::cout << "Tugboat " << 
        (int)waypTugIDs.data[tug] << "to ( " << 
        tugWaypoints[tug].x << ", " << 
        tugWaypoints[tug].y << " )\n";
      }
      else 
      { //No waypoint for you -> stay put
        tempWayp.x = tugPoses[tug].x;
        tempWayp.y = tugPoses[tug].y;
        tempWayp.o = tugPoses[tug].o;
        tempWayp.v = 0;
        std::cout << "Tugboat " << 
        (int)waypTugIDs.data[tug] << " stay put\n";
      }
      tempWayp.ID = waypTugIDs.data[tug];
      tugWayp_pub.publish(tempWayp);
    }
    std::cout << "\n";
    loop_rate.sleep();
  }


  return 0;
}