#include "ros/ros.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/ClearWaypoint.h"

#include "std_msgs/UInt8MultiArray.h"

#include <iostream>
#include <sstream>
#include <unistd.h>
#include <vector>

#define SHIP_ID 4 //Should be 0! 4 for testing purposes
#define ACCEPTABLE_DIST_ERROR 0.3 //30 cm is ok for now

tugboat_control::BoatPose shipPose;
tugboat_control::Waypoint shipWaypoint;

//tugPoses and waypTugIDs have the same indexes for the same tugboats
std_msgs::UInt8MultiArray waypTugIDs;
int numWaypTugs = 0;
std::vector<tugboat_control::BoatPose> tugPoses; 
std::vector<tugboat_control::Waypoint> tugWaypoints; //ID = orderID
int numTugRequests = 0;

void shipPoseCallback(const tugboat_control::BoatPose::ConstPtr& pose_in)
{ //Not used in dummy
  shipPose = *pose_in;
  std::cout << "Ship pose: x = " << shipPose.x << "\ty = " << shipPose.y << "\to = " << shipPose.o << "\n";
}

void tugPoseCallback(const tugboat_control::BoatPose::ConstPtr& pose_in)
{
  std::cout << "Test5\n";
  for (int tug = 0; tug < numWaypTugs; ++tug)
  {
    if(pose_in->ID == waypTugIDs.data[tug]){
      //is tugposes large enough?
      if(waypTugIDs.data.size() > tugPoses.size())
      {
        tugPoses.push_back(*pose_in);
      }
      else 
      {
        tugPoses[tug] = *pose_in;
      }
  std::cout << "Test5\n";
      return;
    }
  }
}

void waypTugsCallback(const std_msgs::UInt8MultiArray::ConstPtr& tugsIn)
{
  /*if tugsIn != waypTugsIDs
      remove and/or add elements from waypTugIDs and tugPoses

  Ideally, they should be the same. Any element not the same is deleted and pushed to the back
  */
  std::cout << "Test6\n";
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
    { //No element added
      tugboat_control::BoatPose blankPose;
      blankPose.ID = waypTugIDs.data[ID];
      blankPose.x = 0;
      blankPose.y = 0;
      blankPose.o = 0;
      newPoses.push_back(blankPose);
    }
  }
  tugPoses = newPoses;
  numWaypTugs = waypTugIDs.data.size();
  std::cout << "Test6\n";
}

void waypReqCallback(const tugboat_control::Waypoint::ConstPtr& waypIn)
{
  std::cout << "Test1\n";
  for (int wayp = 0; wayp < numTugRequests; ++wayp)
  {
    if(tugWaypoints[wayp].ID == waypIn->ID){
      tugWaypoints[wayp] = *waypIn;
      return;
    }
  }
  tugWaypoints.push_back(*waypIn);
  numTugRequests++;
  std::cout << "Test1.1\n";
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "dummyWaypoint");


  ros::NodeHandle n;

  ros::Publisher clearWayp_pub = n.advertise<tugboat_control::ClearWaypoint>("clearWaypoint", 1000);
  ros::Publisher tugWayp_pub = n.advertise<tugboat_control::Waypoint>("waypoint", 10);
  ros::Publisher shipWayp_pub = n.advertise<tugboat_control::Waypoint>("shipWaypoint", 10);

  ros::Subscriber shipPose_sub = n.subscribe("shipPose", 100, shipPoseCallback);
  ros::Subscriber tugPose_sub = n.subscribe("pose", 100, tugPoseCallback);
  ros::Subscriber waypTugs_sub = n.subscribe("waypTugs", 100, waypTugsCallback);
  ros::Subscriber waypReq_sub = n.subscribe("waypointRequest", 100, waypReqCallback);
 
  ros::Rate loop_rate(1);

  shipWaypoint.ID = SHIP_ID;
  shipWaypoint.x = -0.22;
  shipWaypoint.y = -0.22;
  shipWaypoint.o = 0;
  shipWaypoint.v = 0.05;

  while (ros::ok())
  {
    //If any tugboat in my care is within acceptable distance of target waypoint, the waypoint is cleared and the tugboat is released
    for (int waypoint = 0; waypoint < numTugRequests; ++waypoint)
    {
          std::cout << "Test2: wayp:  " << waypoint << "\tnumTugRequests " << numTugRequests << "\n";
      for (int tug = 0; tug < numWaypTugs; ++tug)
      {
          // virker ikke! double test = tugPoses[tug].x; 
          //std::cout << "Test2: tug "<< tug << "\tnumwaypTugs " << numWaypTugs << "\ttestnum: " << test << "\n";
        if(sqrt( pow(tugWaypoints[waypoint].x - tugPoses[tug].x, 2) + pow(tugWaypoints[waypoint].y - tugPoses[tug].y, 2) ) < ACCEPTABLE_DIST_ERROR)
        {
          std::cout << "Test2\n";
          tugboat_control::ClearWaypoint msg;
          msg.tugID = waypTugIDs.data[tug];
          msg.orderID = tugWaypoints[waypoint].ID;
          clearWayp_pub.publish(msg);

          std::cout << "Test2\n";

          tugWaypoints.erase(tugWaypoints.begin() + waypoint);
          waypTugIDs.data.erase(waypTugIDs.data.begin() + tug);
          tugPoses.erase(tugPoses.begin() + tug);
          numWaypTugs--;
          numTugRequests--;
          std::cout << "Test3\n";
          break;
        }
      }
    }

    //Publish all remaining waypoints
    shipWayp_pub.publish(shipWaypoint);

    tugboat_control::Waypoint tempWayp;
    for (int tug = 0; tug < numWaypTugs; ++tug)
    {
      tempWayp = tugWaypoints[tug];
      tempWayp.ID = waypTugIDs.data[tug];
      tugWayp_pub.publish(tempWayp);
    }

    ros::spinOnce();
    loop_rate.sleep();
  }


  return 0;
}