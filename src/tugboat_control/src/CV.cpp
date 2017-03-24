#include "ros/ros.h"
#include "geometry_msgs/Pose2D.h"
#include "tugboat_control/BoatPose.h"

#include <iostream>

/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{
  ros::init(argc, argv, "CV");
  ros::NodeHandle n;
  ros::Publisher CV_pub = n.advertise<tugboat_control::BoatPose>("CV", 1);
  ros::Rate loop_rate(10);

  /**
   Do CV-init here:
   - general init og camera and stuff
   - find coordinate system and scale
   - read parameters for each boat (from text file?)
   */

  while (ros::ok())
  {
/*
    tugboat_control::BoatPose boats; //This is hardcoded to contain 11 entries
    /*
    //ID is inferred by array index
    geometry_msgs/Pose2D[] poses
      float64 x
      float64 y
      float64 theta
    */

    //Scan -> find boats. boat 0 = ship, boats 1-N = tugboats
    /*
    boats.Pose[0].x = 1.1;
    boats.Pose[0].y = 1.2;
    boats.Pose[0].theta = 1.3;
    boats.Pose[1].x = 2.1;
    boats.Pose[1].y = 2.2;
    boats.Pose[1].theta = 2.3;


    CV_pub.publish(boats);
*/
    ros::spinOnce();

    loop_rate.sleep();
    //++count;
  }


  return 0;
}