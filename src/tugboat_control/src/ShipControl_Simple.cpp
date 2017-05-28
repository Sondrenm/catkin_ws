/* Description:
START_UNIQUE
This is an example algorithm for shipControl, which simply arranges tugboat(s)
along one side of the ship, and tries to maintain contact.

STOP_UNIQUE */

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

#define SHIP_ID 0 //Should be 0! 4 for testing purposes ony
#define HALF_SHIP_WIDTH 0.2 //TODO: Check numbers
#define HALF_SHIP_LENGTH 0.3
#define ACCEPTABLE_DIST_ERROR 0.5 //0.5 m from ship means tug has lost contact
#define MAX_PUSHING_FORCE 4.0 //TODO: Update to be Newton or whatever
#define MIN_PUSHING_FORCE 1.0 //Min force required to maintain contact. TODO: Update to be Newton or whatever

int numCtrlTugs = 0;
std_msgs::UInt8MultiArray ctrlTugIDs;
std::vector<tugboat_control::BoatPose> tugPoses; //In ship coordinates (x is along ship)
tugboat_control::BoatPose shipPose;
tugboat_control::Waypoint shipWaypoint;
std_msgs::UInt8MultiArray discardTugs;

void shipPoseCallback(const tugboat_control::BoatPose::ConstPtr& pose_in)
{
	shipPose = *pose_in;
  //TODO: Establish speed
}

tugboat_control::BoatPose worldToShipCoordinates(tugboat_control::BoatPose poseIn)
{ //Transforms from world coordinates to ship coordinates
	tugboat_control::BoatPose poseOut;
	poseOut.ID = poseIn.ID;
	poseOut.o = PIDnormalizeAngle( poseIn.o - shipPose.o );

	double xTemp = poseIn.x - shipPose.x;
	double yTemp = poseIn.y - shipPose.y;
	double sinO = sin(poseOut.o);
	double cosO = cos(poseOut.o);

	poseOut.x = xTemp * cosO - yTemp * sinO;
	poseOut.y = xTemp * sinO + yTemp * cosO;
	return poseOut;
}

void tugPoseCallback(const tugboat_control::BoatPose::ConstPtr& pose_in)
{	
  for (int tug = 0; tug < numCtrlTugs; ++tug)
  {
    if(pose_in->ID == ctrlTugIDs.data[tug]){
      tugPoses[tug] = worldToShipCoordinates(*pose_in);
          std::cout << "Found tugboat at: x=" << tugPoses[tug].x << "\t y=" << tugPoses[tug].y << " in ship coordinates\n";

      if(sqrt( pow(tugPoses[tug].x, 2) + pow(tugPoses[tug].y, 2) ) > ACCEPTABLE_DIST_ERROR)
      {	//Tugboat lost touch with ship - send back to waypoint manager
      	discardTugs.data.push_back(ctrlTugIDs.data[tug]);
      	ctrlTugIDs.data.erase(ctrlTugIDs.data.begin() + tug);
      	std::cout << "Tugboat " << (int)ctrlTugIDs.data[tug] << " strayed too far from ship. Assumed lost.\n";
      	tugPoses.erase(tugPoses.begin() + tug);
      	numCtrlTugs--;
      }
      return;
    }
  }
}

void waypCallback(const tugboat_control::Waypoint::ConstPtr& wayp_in)
{
   shipWaypoint = *wayp_in;
}

void ctrlTugsCallback(const std_msgs::UInt8MultiArray::ConstPtr& tugsIn)
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
    { //No element added above, because no Pose is in record
      tugboat_control::BoatPose blankPose;
      blankPose.ID = ctrlTugIDs.data[ID];
      blankPose.x = 0;
      blankPose.y = 0;
      blankPose.o = 0;
      newPoses.push_back(blankPose);
    }
  }
  tugPoses = newPoses;
  numCtrlTugs = ctrlTugIDs.data.size();
}

//Helper variables and functions
//START_UNIQUE
int determineShipSide(double tugPosAngle)
{ //Sides are: 0 for front, 1 for port, 2 for aft, 3 for starboard
  double cornerAngle = atan2(HALF_SHIP_LENGTH, HALF_SHIP_WIDTH);
  if(abs(tugPosAngle) < cornerAngle)
  {
    return 0;
  }
  else if(abs(tugPosAngle) > 3.14 - cornerAngle)
  {
    return 2;
  }
  else if(cornerAngle > 0)
  {
    return 1;
  }
  else
  {
    return 3;
  }
}
//END_UNIQUE

bool addOneTug(tugboat_control::addOneTug::Request  &req, tugboat_control::addOneTug::Response &res)
{	//If one extra tugboat is needed - where does it go?
	//Pose given in ship coordinates
  std::cout << "Adding one tugboat...\n";

	//START_UNIQUE
	//Tugboats are arrayed around ship, as evenly as possible
  std::vector<double> posAngles(numCtrlTugs);
  std::vector<double> dPosAngles(numCtrlTugs);

  for (int tug = 0; tug < numCtrlTugs; ++tug)
  {
    posAngles[tug] = atan2(tugPoses[tug].y, tugPoses[tug].x);
  }

  std::sort(posAngles.begin(), posAngles.end());

  for (int tug = 0; tug < numCtrlTugs - 1; ++tug)
  {
    dPosAngles[tug] = posAngles[tug+1] - posAngles[tug];
  }
  dPosAngles[numCtrlTugs] = PIDnormalizeAngle(posAngles[0] - posAngles[numCtrlTugs]);

  int max_elementIterator = std::distance(dPosAngles.begin(), std::max_element(dPosAngles.begin(), dPosAngles.end()));
  double newPosAngle = PIDnormalizeAngle(posAngles[max_elementIterator] + dPosAngles[max_elementIterator]/2);

  //Set waypoint along a circle around the ship

	res.Pose.x = HALF_SHIP_LENGTH * cos(newPosAngle);
	res.Pose.y = HALF_SHIP_WIDTH * sin(newPosAngle);
	res.Pose.o = 0; //Not used
	//END_UNIQUE
  std::cout << "Requested tugboat at: x=" << res.Pose.x << "\t y=" << res.Pose.y << "\n";
	return true;
}

bool removeOneTug(tugboat_control::removeOneTug::Request  &req, tugboat_control::removeOneTug::Response &res)
{	//If there are too many tugboats, one is removed
	if(numCtrlTugs > 0){
		//START_UNIQUE
		res.ID = ctrlTugIDs.data[numCtrlTugs]; //This algorithm simply selects the last tugboat on the list
		//END_UNIQUE
		std::cout << "Removing tugboat " << (int)res.ID << " from Ship Control\n";
		for (int tug = 0; tug < numCtrlTugs; ++tug)
		{ //Remove the selected tugboat from lists
			if(res.ID == ctrlTugIDs.data[tug]){
    			ctrlTugIDs.data.erase(ctrlTugIDs.data.begin() + tug);
    			tugPoses.erase(tugPoses.begin() + tug);
  			}
  			break;
		}	
		numCtrlTugs--;
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
  double shipSetHeading = atan2(shipWaypoint.y - shipPose.y, shipWaypoint.x - shipPose.x );
	//START_UNIQUE
	tugboat_control::TugSetpoints ctrl;
	for (int tug = 0; tug < numCtrlTugs; ++tug)
	{
		ctrl.ID = ctrlTugIDs.data[tug];
    double oSetShipCoordinates = -3.14 + 1.57 * determineShipSide(tugPoses[tug].o);

		ctrl.o = PIDnormalizeAngle(oSetShipCoordinates + shipPose.o);
		ctrl.force = std::min(MIN_PUSHING_FORCE, MAX_PUSHING_FORCE * cos(tugPoses[tug].o - shipSetHeading) ); //TODO: Calibrate load cell, find threshold, and update this number
		pub->publish(ctrl);
	}//END_UNIQUE
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "generic_control");
  ros::NodeHandle n;

  ros::ServiceServer remove_service = n.advertiseService("removeOneTug", removeOneTug);
  ros::ServiceServer add_service = n.advertiseService("addOneTug", addOneTug);

  ros::Subscriber wayp_sub = n.subscribe("shipWaypoint", 1, waypCallback);
  ros::Subscriber shipPose_sub = n.subscribe("shipPose", 100, shipPoseCallback);
  ros::Subscriber tugPose_sub = n.subscribe("pose", 100, tugPoseCallback);
  ros::Subscriber ctrlTugs_sub = n.subscribe("ctrlTugs", 100, ctrlTugsCallback);

  ros::Publisher ctrl_pub = n.advertise<tugboat_control::TugSetpoints>("control", 100);
  ros::Publisher stress_pub = n.advertise<std_msgs::Bool>("distress", 100);
  ros::Publisher discard_pub = n.advertise<std_msgs::UInt8>("ctrlClear", 100);
  
  ros::Rate loop_rate(10);

  std::cout << "Ship Control node initialized successfully\n";

  while (ros::ok())
  {
  	if(numCtrlTugs > 0)
  	{
  		control(&ctrl_pub);
  	}
  	else {
  		std_msgs::Bool msg;
  		msg.data = true;
  		stress_pub.publish(msg);
      std::cout << "No tugs attached to ship!\n";
  	}
  	while( discardTugs.data.size() > 0)
  	{
  		std_msgs::UInt8 msg;
  		msg.data = discardTugs.data[0];
  		discard_pub.publish(msg);
  		discardTugs.data.erase(discardTugs.data.begin());
  	}
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}