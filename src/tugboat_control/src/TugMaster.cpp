/* 
TugMaster is responsible for handing out responsibility for tugboats
to either Ship Control or Waypoint Control, based on how hard the tugboats 
are working (based on thrust of pushingForce? Some sort of distress msg. From TugController?). 
Responsibility is NOT passed on by sending lists with IDs

When a tugboat reaches its final waypoint, what happens? 
Ship control takes over - target o and pushingForce > C(positive), which will
make the tugboat move towards the ship until it makes contact. Must be a timeout here.
*/

#include "ros/ros.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/PushingForce.h"
#include "std_msgs/Bool.h"
#include "std_msgs/UInt8MultiArray.h"
#include "std_msgs/UInt8.h"

#include "tugboat_control/addOneTug.h"
#include "tugboat_control/removeOneTug.h"

#include <iostream>
#include <sstream>
#include <unistd.h>

#define MUCH_DISTRESS 100

int addedTugs = 0; //number of Tugboats on their way to support the ship.
int distress = 1000;
std_msgs::UInt8MultiArray waypTugs;
std_msgs::UInt8MultiArray ctrlTugs;
std::vector<tugboat_control::BoatPose> tugRequests; //In ship coordinates (x is along ship), ID = order ID, not tug ID
tugboat_control::BoatPose shipPose;

void distressCallback(const std_msgs::Bool::ConstPtr& stressed)
{
  if(stressed->data){
    distress++;
  } else {
    distress--;
  }
}

void respondToDistress(ros::ServiceClient *remove_client, tugboat_control::removeOneTug *remove_srv, ros::ServiceClient *add_client, tugboat_control::addOneTug *add_srv)
{
  if (distress > MUCH_DISTRESS * (addedTugs + 1) ) {
    if(add_client->call(*add_srv)){
      //Add to tugRequests
      addedTugs++; 
      tugRequests.push_back(add_srv->response.Pose);
    }
  } else if(distress < MUCH_DISTRESS * (addedTugs - 1)) {
    if(remove_client->call(*remove_srv)){
      addedTugs--; 
      //remove Tugboat from ctrlTugs, add to wapyTugs
      for (uint8_t i = 0; i < sizeof(waypTugs); ++i)
      {
        if(ctrlTugs.data[i] == remove_srv->response.ID){
          ctrlTugs.data.erase(ctrlTugs.data.begin() + i);
          waypTugs.data.push_back(remove_srv->response.ID);
        }
      }
    }
  }
}

void waypClearCallback(const std_msgs::UInt8::ConstPtr& waypID)
{ //Clear tugRequest
  for (int i = 0; i < sizeof(tugRequests)/sizeof(tugRequests[0]); ++i)
  {
    if(tugRequests[i].ID == waypID->data){
      tugRequests.erase(tugRequests.begin() + i);
    }
  }
}

void shipPoseCallback(const tugboat_control::BoatPose::ConstPtr& pose_in)
{
  shipPose = *pose_in;
}

void sendTugRequests(ros::Publisher *pub)
{ //Take tugRequests, transform to world coordinate system, and send to Waypoint manager
  tugboat_control::Waypoint wayp;
  for (int tug = 0; tug < addedTugs; ++tug)
  {
    //wayp =  tugRequests[tug]; //Plus some Rotation magic
    pub->publish(wayp);
  }
}

tugboat_control::Waypoint shipToWorldCoordinates(tugboat_control::Waypoint waypIn)
{

  return waypOut;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "manager");
  ros::NodeHandle n;

  ros::ServiceClient remove_client = n.serviceClient<tugboat_control::removeOneTug>("removeOneTug");
  tugboat_control::removeOneTug remove_srv;

  ros::ServiceClient add_client = n.serviceClient<tugboat_control::addOneTug>("addOneTug");
  tugboat_control::addOneTug add_srv;

  ros::Subscriber pose_sub = n.subscribe("shipPose", 100, shipPoseCallback); //Get position of ship
  ros::Subscriber distress_sub = n.subscribe("distress", 1000, distressCallback); //
  ros::Subscriber waypClear_sub = n.subscribe("waypointCleared", 100, waypClearCallback); //
  

  ros::Publisher waypTugs_pub = n.advertise<std_msgs::UInt8MultiArray>("waypTugs", 1); //List of tugboats controlled by Waypoints
  ros::Publisher ctrlTugs_pub = n.advertise<std_msgs::UInt8MultiArray>("ctrlTugs", 1); //List of tugboats controlled by Ship Control
  ros::Publisher waypReq_pub = n.advertise<tugboat_control::Waypoint>("waypointRequest", 1000); //Requests tugboats at specific locations from Waypoint manager
  
  ros::Rate loop_rate(1);

  while (ros::ok())
  {
    respondToDistress(&remove_client, &remove_srv, &add_client, &add_srv);
    sendTugRequests(&waypReq_pub);
    waypTugs_pub.publish(waypTugs);
    ctrlTugs_pub.publish(ctrlTugs);
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}