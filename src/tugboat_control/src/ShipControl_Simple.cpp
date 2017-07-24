//ShipControl.cpp

#include "ros/ros.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/PushingForce.h"
#include "tugboat_control/TugSetpoints.h"
#include "std_msgs/Bool.h"
#include "std_msgs/UInt8MultiArray.h"
#include "std_msgs/UInt8.h"
#include "tugboat_control/addOneTug.h"
#include "tugboat_control/removeOneTug.h"

#include "/usr/local/include/PID_cpp/pid.h"
#include <iostream>
#include <sstream>
#include <unistd.h>
#include <vector>
#include <algorithm>
#include <cmath>

#define SHIP_ID 0 
#define HALF_SHIP_WIDTH 0.35 
//plus one tugboat radius + margin 
#define HALF_SHIP_LENGTH 0.40 
//plus one tugboat radius + margin 
#define ACCEPTABLE_DIST_ERROR 1.0 
//0.5 m from ship means tug has lost contact
#define MAX_PUSHING_FORCE 0.5 
//Max setpoint for pushing force, in N
#define MIN_PUSHING_FORCE 0.1 
//Min force required to maintain contact, in N

uint8_t orderID = 0;
std_msgs::UInt8MultiArray ctrlTugIDs;
std::vector<tugboat_control::BoatPose> tugPoses; 
//In ship coordinates (x is along ship)
tugboat_control::BoatPose shipPose;
tugboat_control::Waypoint shipWaypoint;
std_msgs::UInt8MultiArray discardTugs;

void shipPoseCallback(const tugboat_control::BoatPose::
  ConstPtr& pose_in)
{
	shipPose = *pose_in;
}

tugboat_control::BoatPose worldToShipCoordinates(
  tugboat_control::BoatPose poseIn)
{ //Transforms from world coordinates to ship coordinates
	tugboat_control::BoatPose poseOut;
	poseOut.ID = poseIn.ID;
	poseOut.o = PIDnormalizeAngle( poseIn.o - shipPose.o );

	double dx = poseIn.x - shipPose.x;
	double dy = poseIn.y - shipPose.y;
	double sinO = sin(shipPose.o);
	double cosO = cos(shipPose.o);

  //Rotation matrix opposite of normal because the
  // coordinate system is left-handed, thus rotation
  // is clockwise
  poseOut.x = cosO * dx + sinO * dy;
  poseOut.y = - sinO * dx + cosO * dy;
	return poseOut;
}

void tugPoseCallback(const tugboat_control::
  BoatPose::ConstPtr& pose_in)
{	
  for (int tug = 0; tug < ctrlTugIDs.data.size(); ++tug)
  {
    if(pose_in->ID == ctrlTugIDs.data[tug]){
      tugPoses[tug] = worldToShipCoordinates(*pose_in);
      if(sqrt( pow(tugPoses[tug].x, 2) + 
        pow(tugPoses[tug].y, 2) ) > 
        ACCEPTABLE_DIST_ERROR)
      {	//Tugboat lost touch with ship - 
        //send back to waypoint manager
      	discardTugs.data.push_back(ctrlTugIDs.data[tug]);
      	std::cout << "Tugboat " << 
        (int)ctrlTugIDs.data[tug] << 
        " strayed too far from ship. Assumed lost.\n";
      }
      return;
    }
  }
}

void waypCallback(const tugboat_control::Waypoint::
  ConstPtr& wayp_in)
{
   shipWaypoint = *wayp_in;
}

void ctrlTugsCallback(const std_msgs::UInt8MultiArray::
  ConstPtr& tugsIn)
{
  std::vector<tugboat_control::BoatPose> newPoses; 

  ctrlTugIDs = *tugsIn;
  for (int ID = 0; ID < ctrlTugIDs.data.size(); ++ID)
  {
    for (int pose = 0; pose < tugPoses.size(); ++pose)
    {
      if(tugPoses[pose].ID == ctrlTugIDs.data[ID])
      {
        newPoses.push_back(tugPoses[pose]);
        break;
      }
    }
    if(newPoses.size() <= ID)
    { //No element added above, because no Pose
    // is in record
      tugboat_control::BoatPose blankPose;
      blankPose.ID = ctrlTugIDs.data[ID];
      blankPose.x = 0;
      blankPose.y = -10;
      blankPose.o = 0;
      newPoses.push_back(blankPose);
      std::cout << "Adding tugboat " << 
      (int)ctrlTugIDs.data[ID] << " to Ship Control. +n"; 
    }
  }
  tugPoses = newPoses;
}

//Helper variables and functions
//START_UNIQUE
int startUpPositioningVariable = 0;

int determineShipSide(tugboat_control::BoatPose tugPose)
 //tugPose in ship coordinates
{ //Sides are: 0 for front, 3 for port, 2 for aft,
// 1 for starboard
  double tugPosAngle = atan2(tugPose.y, tugPose.x); 
  //angle from origin to tug position in ship coordinates
  double cornerAngle = atan2(HALF_SHIP_WIDTH, 
    HALF_SHIP_LENGTH);
  std::cout << "tugPosAngle: " << tugPosAngle << 
  " cornerAngle: " << cornerAngle << "\n";
  if(std::abs(tugPosAngle) < cornerAngle)
  {
    return 0;
  }
  else if(std::abs(tugPosAngle) > (3.14 - cornerAngle))
  {
    return 2;
  }
  else if(tugPosAngle > 0)
  {
    return 1;
  }
  else
  {
    return 3;
  }
}
//END_UNIQUE

bool addOneTug(tugboat_control::addOneTug::Request  
  &req, tugboat_control::addOneTug::Response &res)
{	//If one extra tugboat is needed - where does it go?
	//Pose given in ship coordinates
  std::cout << "Adding one tugboat...\t";

	//START_UNIQUE
	//Tugboats are arrayed around ship, as evenly as 
  //possible
  int shipSide;
  if(startUpPositioningVariable < 4)
  { //First 4 tugboats should go to opposing sides
    shipSide = startUpPositioningVariable++;
  }
  else
  {
    std::vector<int> occupancy(4);
    double tugPosAngle;
    //Count number of tugboats at each ship side
    for (int tug = 0; tug < ctrlTugIDs.data.size(); ++tug)
    { 
      occupancy[determineShipSide(tugPoses[tug])]++; 
    }
    //Send tugboat to ship side with the fewest tugboats
    std::vector<int>::iterator it = std::min_element(
      occupancy.begin(), occupancy.end());
    shipSide = std::distance(occupancy.begin(), it);
  }

  switch(shipSide)
  {
    case 0: 
    {
      res.Pose.x = HALF_SHIP_LENGTH;
      res.Pose.y = 0;
      break;
    }
    case 1: 
    {
      res.Pose.x = 0;
      res.Pose.y = HALF_SHIP_WIDTH;
      break;
    }
    case 2:
    {
      res.Pose.x = -HALF_SHIP_LENGTH;
      res.Pose.y = 0;
      break;
    }
    case 3:
    {
      res.Pose.x = 0;
      res.Pose.y = -HALF_SHIP_WIDTH;
      break;
    }
  }
  std::cout << "Requesting tugboat on side " << 
  shipSide << " (0: stern, 1: starboard, 2: aft, 3: 
  port).\n";
  res.Pose.ID = orderID++;
	res.Pose.o = 0; //Not used
	//END_UNIQUE
  std::cout << "Requested tugboat at: x=" << 
  res.Pose.x << "\t y=" << res.Pose.y << "\n";
	return true;
}

bool removeOneTug(tugboat_control::removeOneTug::Request
  &req, tugboat_control::removeOneTug::Response &res)
{	//If there are too many tugboats, one is removed
	if(ctrlTugIDs.data.size() > 0){
		//START_UNIQUE
		res.ID = ctrlTugIDs.data[ctrlTugIDs.data.size()]; 
    //This algorithm simply selects the last tugboat 
    //on the list
		//END_UNIQUE
		std::cout << "Removing tugboat " << (int)res.ID <<
     " from Ship Control\n";
		return true;
	} 
	else 
	{
		return false;
	}
}

void control(ros::Publisher *pub)
{	//This is where the magic happens
  //Find out where the ship should be going
  double shipSetHeading = atan2(shipWaypoint.y 
    - shipPose.y, shipWaypoint.x - shipPose.x );
	//START_UNIQUE
	tugboat_control::TugSetpoints ctrl;
	for (int tug = 0; tug < ctrlTugIDs.data.size(); ++tug)
	{
		ctrl.ID = ctrlTugIDs.data[tug];
    std::cout << "Tug " << (int)ctrl.ID << 
    " at shipSide " << determineShipSide(tugPoses[tug])
     << " in ship coordinates ( " << tugPoses[tug].x
      << ", " << tugPoses[tug].y << " )\n";
    double oSetShipCoordinates = -3.14 + 1.57 * 
    determineShipSide(tugPoses[tug]);

		ctrl.o = PIDnormalizeAngle(oSetShipCoordinates +
     shipPose.o);
		ctrl.force = std::max(MIN_PUSHING_FORCE, 
      MAX_PUSHING_FORCE * cos(ctrl.o - shipSetHeading) ); 
		pub->publish(ctrl);
	}//END_UNIQUE
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "generic_control");
  ros::NodeHandle n;
  ros::ServiceServer remove_service = 
  n.advertiseService("removeOneTug", removeOneTug);
  ros::ServiceServer add_service = 
  n.advertiseService("addOneTug", addOneTug);
  ros::Subscriber wayp_sub = 
  n.subscribe("shipWaypoint", 1, waypCallback);
  ros::Subscriber shipPose_sub = 
  n.subscribe("shipPose", 100, shipPoseCallback);
  ros::Subscriber tugPose_sub = 
  n.subscribe("pose", 100, tugPoseCallback);
  ros::Subscriber ctrlTugs_sub = 
  n.subscribe("ctrlTugs", 100, ctrlTugsCallback);
  ros::Publisher ctrl_pub = 
  n.advertise<tugboat_control::TugSetpoints>(
    "control", 100);
  ros::Publisher stress_pub = 
  n.advertise<std_msgs::Bool>("distress", 100);
  ros::Publisher discard_pub = 
  n.advertise<std_msgs::UInt8>("ctrlClear", 100);
  
  ros::Rate loop_rate(10);

  shipWaypoint.ID = SHIP_ID;
  shipWaypoint.x = 1;
  shipWaypoint.y = 1;
  shipWaypoint.o = 0;
  shipWaypoint.v = 0.05;

  std::cout << "Ship Control node initialized 
  successfully\n";

  while (ros::ok())
  {
    ros::spinOnce();
  	if(ctrlTugIDs.data.size() > 0)
  	{
  		control(&ctrl_pub);
  	}
  	else {
  		std_msgs::Bool msg;
  		msg.data = true;
  		stress_pub.publish(msg);
  	}

  	while( discardTugs.data.size() > 0)
  	{
      std::cout << "Discarding tugboat " << 
      (int)discardTugs.data[0] << " from Ship Control\n";
  		
      std_msgs::UInt8 msg;
  		msg.data = discardTugs.data[0];
  		discard_pub.publish(msg);
  		discardTugs.data.erase(discardTugs.data.begin());
      std::cout << "Debug: Discard OK\n";
  	}
    loop_rate.sleep();
  }
  return 0;
}