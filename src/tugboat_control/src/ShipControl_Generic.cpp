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

#include "tugboat_control/addOneTug.h"
#include "tugboat_control/removeOneTug.h"

#include "/usr/local/include/PID_cpp/pid.h"

#include <iostream>
#include <sstream>
#include <unistd.h>
#include <vector>

#define SHIP_ID 4 //Should be 0! 4 for testing purposes ony

int numCtrlTugs = 0;
std_msgs::UInt8MultiArray ctrlTugIDs;
std::vector<tugboat_control::BoatPose> tugPoses; //In ship coordinates (x is along ship)
tugboat_control::BoatPose shipPose;
tugboat_control::Waypoint shipWaypoint;

void shipPoseCallback(const tugboat_control::BoatPose::ConstPtr& pose_in)
{
	shipPose = *pose_in;
}

void tugPoseCallback(const tugboat_control::BoatPose::ConstPtr& pose_in)
{	
	for (int tug = 0; tug < numCtrlTugs; ++tug)
	{
		if(pose_in->ID == ctrlTugIDs.data[tug]){
	
    		tugPoses[tug] = *pose_in;
    		return;
  		}
	}
}

void waypCallback(const tugboat_control::Waypoint::ConstPtr& wayp_in)
{
   shipWaypoint = *wayp_in;
}

void ctrlTugsCallback(const std_msgs::UInt8MultiArray::ConstPtr& tugs_in)
{
	ctrlTugIDs = *tugs_in;
	numCtrlTugs = ctrlTugIDs.data.size();
}

bool addOneTug(tugboat_control::addOneTug::Request  &req, tugboat_control::addOneTug::Response &res)
{	//If one extra tugboat is needed - where does it go?
	//Pose given in ship coordinates
	
	//START_UNIQUE
	//Tugboats are lined up along starboard side, perpendicular to the ship
	res.Pose.x = 0.2 * numCtrlTugs;
	res.Pose.y = -0.2;
	res.Pose.o = 1.57;
	//END_UNIQUE
	return true;
}

bool removeOneTug(tugboat_control::removeOneTug::Request  &req, tugboat_control::removeOneTug::Response &res)
{	//If there are too many tugboats, one is removed
	//START_UNIQUE
	if(numCtrlTugs > 0){
		res.ID = ctrlTugIDs.data[numCtrlTugs]; //This algorithm simply selects the last tugboat
		//END_UNIQUE
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
	//START_UNIQUE
	tugboat_control::TugSetpoints ctrl;
	for (int tug = 0; tug < numCtrlTugs; ++tug)
	{
		std::cout << "hei\n";
		//get thrust from somewhere
		ctrl.ID = ctrlTugIDs.data[tug];
		ctrl.o = 0;
		ctrl.force = 2; //TODO: Calibrate load cell, find threshold, and update this number
		pub->publish(ctrl);
	}//END_UNIQUE
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
	//TODO: Double check this!
	return poseOut;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "generic_control");
  ros::NodeHandle n;

  ros::ServiceServer remove_service = n.advertiseService("removeOneTug", removeOneTug);
  ros::ServiceServer add_service = n.advertiseService("addOneTug", addOneTug);

  ros::Subscriber wayp_sub = n.subscribe("shipWaypoint", 1, waypCallback);
  ros::Subscriber shipPose_sub = n.subscribe("shipPose", 100, shipPoseCallback);
  ros::Subscriber tugPose_sub = n.subscribe("tugPose", 100, tugPoseCallback);
  ros::Subscriber ctrlTugs_sub = n.subscribe("ctrlTugs", 100, ctrlTugsCallback);

  ros::Publisher ctrl_pub = n.advertise<tugboat_control::TugSetpoints>("control", 100);
  ros::Publisher stress_pub = n.advertise<std_msgs::Bool>("distress", 100);
  
  ros::Rate loop_rate(10);

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
  	}
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}