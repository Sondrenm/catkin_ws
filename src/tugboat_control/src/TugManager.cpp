//TugManager.cpp

#include "ros/ros.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/PushingForce.h"
#include "tugboat_control/ClearWaypoint.h"
#include "std_msgs/Bool.h"
#include "std_msgs/UInt8MultiArray.h"
#include "std_msgs/UInt8.h"
#include "tugboat_control/addOneTug.h"
#include "tugboat_control/removeOneTug.h"

#include "/usr/local/include/PID_cpp/pid.h"
#include <iostream>
#include <sstream>
#include <unistd.h>

#define SHIP_ID 0 
#define STRESS_MODE false //Dynamic tugboat allocation 
//using stress levels was only partially implemented
#define MUCH_DISTRESS 100

int distress = 100;
uint8_t orderIDcount = 0;

std_msgs::UInt8MultiArray waypTugs;
std_msgs::UInt8MultiArray ctrlTugs;
std::vector<tugboat_control::BoatPose> tugRequests; 
//In ship coordinates (x is along ship), ID = order ID,
// not tug ID
tugboat_control::BoatPose shipPose;
tugboat_control::Waypoint shipWaypoint;

void distressCallback(const std_msgs::Bool::ConstPtr& 
  stressed)
{
  if(stressed->data){
    distress++;
  } else {
    distress--;
  }
}

void respondToDistress(ros::ServiceClient *remove_client,
 tugboat_control::removeOneTug *remove_srv, 
 ros::ServiceClient *add_client, 
 tugboat_control::addOneTug *add_srv)
{
  if (distress > MUCH_DISTRESS * (tugRequests.size()
   + 1) && waypTugs.data.size() > tugRequests.size()
    ) {
    std::cout << "Requesting new tugboat to Ship
     Control\n";
    if(add_client->call(*add_srv)){
      //Add to tugRequests
      tugboat_control::BoatPose tempRequest = 
      add_srv->response.Pose;
      tempRequest.ID = ++orderIDcount;
      tugRequests.push_back(tempRequest);
      std::cout << "Request approved. " << 
      tugRequests.size() << " tugs on their way to 
      support ship\n";
    }
    else 
    {
      std::cout << "Request denied\n";
    }
  } else if(distress < MUCH_DISTRESS * 
    (tugRequests.size() - 1)) {
    if(remove_client->call(*remove_srv)){
      std::cout << "Removing tugboat " << 
      (int)remove_srv->response.ID << " from Ship 
      Control\n";
      //remove Tugboat from ctrlTugs, add to wapyTugs
      for (uint8_t i = 0; i < ctrlTugs.data.size(); ++i)
      {
        if(ctrlTugs.data[i] == remove_srv->response.ID){
          ctrlTugs.data.erase(ctrlTugs.data.begin() + i);
          waypTugs.data.push_back(remove_srv->response.ID);
          break;
        }
      }
    }
  }
}

void waypClearCallback(const tugboat_control::
  ClearWaypoint::ConstPtr& msg)
{ //Clear tugRequest, give responsibillity from
// Waypoint to ShipControl
  std::cout << "Tugboat " << (int)msg->tugID << 
  " has reached its final waypoint. Assigning to 
  Ship Control.\n";
  for (int i = 0; i < tugRequests.size(); ++i)
  {
    if(tugRequests[i].ID == msg->orderID){
      tugRequests.erase(tugRequests.begin() + i);
      break;
    }
  }
  for (int i = 0; i < waypTugs.data.size(); ++i)
  {
    if(waypTugs.data[i] == msg->tugID){
      waypTugs.data.erase(waypTugs.data.begin() + i);
      ctrlTugs.data.push_back(msg->tugID);
      break;
    }
  }  
}

void ctrlClearCallback(const std_msgs::UInt8::ConstPtr&
 tugID)
{ //Clear from ShipControl for tugs that loose contact
// with shi etc
  for (int tug = 0; tug < ctrlTugs.data.size(); ++tug)
  {
    if(ctrlTugs.data[tug] == tugID->data)
    {  
      std::cout << "Tugboat " << (int)tugID->data <<
       " has strayed too far from the ship. Assigning
        to Waypoint Control.\n";
      ctrlTugs.data.erase(ctrlTugs.data.begin() + tug);
      waypTugs.data.push_back(tugID->data);
    }
  }
}

tugboat_control::Waypoint shipToWorldCoordinates(
  tugboat_control::BoatPose poseIn)
{
  tugboat_control::Waypoint wayp;
  wayp.ID = poseIn.ID;
  wayp.v = 0;
  wayp.o = 0;

  double sinO = sin(shipPose.o);
  double cosO = cos(shipPose.o);

  wayp.x = (cosO * poseIn.x - sinO * poseIn.y) + 
  shipPose.x;
  wayp.y = (sinO * poseIn.x + cosO * poseIn.y) + 
  shipPose.y;
  return wayp;
}

void shipPoseCallback(const tugboat_control::BoatPose::
  ConstPtr& pose_in)
{
  shipPose = *pose_in;
}

void sendTugRequests(ros::Publisher *pub)
{ //Take BoatPose tugRequests, transform to world 
  //coordinate system, and send as waypoint to Waypoint manager
  tugboat_control::Waypoint wayp;
  for (int tug = 0; tug < tugRequests.size(); ++tug)
  {
    wayp = shipToWorldCoordinates(tugRequests[tug]);
    pub->publish(wayp);  
    std::cout << "Sent waypoint request to: x=" << 
    wayp.x << "\t y=" << wayp.y << "\n";
  }
  std::cout << "\n";
}

void startupCallback(const std_msgs::UInt8::ConstPtr&
 IDIn)
{
  waypTugs.data.push_back(IDIn->data);
  std::cout << "Starting new tugboat with id " << 
  (int)IDIn->data << "\n";
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "manager");
  ros::NodeHandle n;

  ros::ServiceClient remove_client = n.serviceClient<
  tugboat_control::removeOneTug>("removeOneTug");
  tugboat_control::removeOneTug remove_srv;

  ros::ServiceClient add_client = n.serviceClient<
  tugboat_control::addOneTug>("addOneTug");
  tugboat_control::addOneTug add_srv;

  ros::Subscriber pose_sub = n.subscribe(
  "shipPose", 100, shipPoseCallback); 
  //Get position of ship
  ros::Subscriber distress_sub = n.subscribe(
  "distress", 1000, distressCallback); //
  ros::Subscriber waypClear_sub = n.subscribe(
  "clearWaypoint", 100, waypClearCallback); //
  ros::Subscriber startup_sub = n.subscribe(
  "startup", 100, startupCallback); //
  ros::Subscriber ctrlClear_sub = n.subscribe(
  "ctrlClear", 100, ctrlClearCallback); //

  ros::Publisher waypTugs_pub = n.advertise<
  std_msgs::UInt8MultiArray>("waypTugs", 1); 
  //List of tugboats controlled by Waypoints
  ros::Publisher ctrlTugs_pub = n.advertise<
  std_msgs::UInt8MultiArray>("ctrlTugs", 1); 
  //List of tugboats controlled by Ship Control
  ros::Publisher waypReq_pub = n.advertise<
  tugboat_control::Waypoint>("waypointRequest", 1000); 
  //Requests tugboats at specific locations from Waypoint
  // manager
  ros::Publisher shipWayp_pub = n.advertise<
  tugboat_control::Waypoint>("shipWaypoint", 1);

  shipWaypoint.ID = SHIP_ID;
  shipWaypoint.x = 1;
  shipWaypoint.y = 1;
  shipWaypoint.o = 0;
  shipWaypoint.v = 0.05;

  ros::Rate loop_rate(1);

  std::cout << "Tug Manager node initialized 
  successfully\n";

  while (ros::ok())
  {
    ros::spinOnce();
    waypTugs_pub.publish(waypTugs);
    ctrlTugs_pub.publish(ctrlTugs);
    shipWayp_pub.publish(shipWaypoint); //for 
    illustration purposes only

    if(STRESS_MODE)
    {    
      std::cout << "Stress level: " << distress << "\n";
      respondToDistress(&remove_client, &remove_srv,
       &add_client, &add_srv);
    }
    else if(waypTugs.data.size() > tugRequests.size())
    { //All tugboats added to control
      std::cout << "Adding one tugboat to ship control... ";
      if(add_client.call(add_srv)){
      //Add to tugRequests
      tugboat_control::BoatPose tempRequest = 
      add_srv.response.Pose;
      tempRequest.ID = ++orderIDcount;
      tugRequests.push_back(tempRequest);
      std::cout << "Request approved. " << 
      tugRequests.size() << " tugs shipbound\n";
      }
      else 
      {
        std::cout << "Request denied\n";
      }
    }
    sendTugRequests(&waypReq_pub);
    std::cout << "numCtrlTugs: " << ctrlTugs.data.size() 
    << "\tnumWaypTugs: " << waypTugs.data.size() << "\n";

    loop_rate.sleep();
  }
  return 0;
}