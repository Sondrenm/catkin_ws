#include "ros/ros.h"
#include "std_msgs/String.h"
#include "tugboat_control/BoatList.h"
#include "tugboat_control/BoatStatus.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/WaypointRequest.h"
#include "tugboat_control/PushingForce.h"

#include <iostream>
#include <sstream>
#include <unistd.h>
/*
struct boatStruct
{
  bool engaged;
  float x;
  float y;
  float o;
  float force;
};

boatStruct boatList[11]; //initialise in main
*/
//tugboat_control::BoatList boatList; //List of ships and tugboats with relevant information
//ControlMode variabel

void posCallback(const tugboat_control::BoatList& list)
{
  /*
  //put received positions into BoatList
  for(tugboat_control::BoatStatus boat : list.boat)
  {
    boatList[boat.ID].x = boat.x;
    boatList[boat.ID].y = boat.y;
    boatList[boat.ID].o = boat.o;
  }
  std::cout << boatList;
  */
}

void pushCallback(const tugboat_control::PushingForce& push)
{
  /*
  boatList[push.ID].force = push.force;
  */
}

/*
void inputCallback(const std_msgs::String& input)
{
  // Take input from cmd line to change control mode etc
  // Implement if needed
  if(input == "something")
  {
    //do something
  }
  else 
  {
    cout << "Got unidentified input\n";
  }
}
*/

/*
TugManager should: 
- get and store pose and pushing force for all tugboats
- disengage unneccessary tugboats by passing them to Waypoint Manager
- engage new tugboats by sending a WaypointRequest to Waypoint Manager 
- TODO: What to do about moving targets for Waypoint Requests? Discuss with R
- send status on ship and engaged tugboats to ship controller
- send status on ship and disengaged tugboats to waypoint manager (Ask R)
*/

int main(int argc, char **argv)
{
  ros::init(argc, argv, "manager");
  ros::NodeHandle n;

  ros::Subscriber pos_sub = n.subscribe("pos", 1, posCallback); //Get positions of all boats from CV
  ros::Subscriber push_sub = n.subscribe("pushingForce", 1, pushCallback); //Get positions of all boats from CV
  //ros::Subscriber input_sub = n.subscribe("input", 1, inputCallback); //Get input from user - implement if time and necessary

	ros::Publisher ctrl_pub = n.advertise<tugboat_control::BoatList>("shipControlInput", 1); //give relevant information on ship and tugboats to shipControl
  ros::Publisher status_pub = n.advertise<tugboat_control::BoatStatus>("status", 1000); //Sends status on detatched tugboats to waypoint manager
  ros::Publisher waypReq_pub = n.advertise<tugboat_control::WaypointRequest>("waypointRequest", 1000); //Requests tugboats at specific locations, as demanded by control manager

  ros::Rate loop_rate(10);

  while (ros::ok())
  {
    //ctrl_pub.publish(boatList);
    //status_pub.publish(status);
    ros::spinOnce();
    loop_rate.sleep();
  }


  return 0;
}