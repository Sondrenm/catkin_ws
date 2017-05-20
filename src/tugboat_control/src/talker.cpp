#include "ros/ros.h"
#include "std_msgs/String.h"
#include "tugboat_control/Thrust.h"
#include "tugboat_control/TugSetpoints.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Waypoint.h"

#include <iostream>
#include <sstream>
#include <unistd.h>

/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line.
   * For programmatic remappings you can use a different version of init() which takes
   * remappings directly, but for most command-line programs, passing argc and argv is
   * the easiest way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "talker");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  ros::NodeHandle n;

  /**
   * The advertise() function is how you tell ROS that you want to
   * publish on a given topic name. This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing. After this advertise() call is made, the master
   * node will notify anyone who is trying to subscribe to this topic name,
   * and they will in turn negotiate a peer-to-peer connection with this
   * node.  advertise() returns a Publisher object which allows you to
   * publish messages on that topic through a call to publish().  Once
   * all copies of the returned Publisher object are destroyed, the topic
   * will be automatically unadvertised.
   *
   * The second parameter to advertise() is the size of the message queue
   * used for publishing messages.  If messages are published more quickly
   * than we can send them, the number here specifies how many messages to
   * buffer up before throwing some away.
   */
  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
  ros::Publisher cmd_pub = n.advertise<tugboat_control::Thrust>("thrust", 1000);
	ros::Publisher ctrl_pub = n.advertise<tugboat_control::TugSetpoints>("control", 1000);
  ros::Publisher pose_pub = n.advertise<tugboat_control::BoatPose>("pose", 10);
  ros::Publisher wayp_pub = n.advertise<tugboat_control::Waypoint>("waypoint", 10);

  ros::Rate loop_rate(1);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
  int count = 0;
  while (ros::ok())
  {
    /*
    std_msgs::String msg;

    std::stringstream ss;
    ss << "hello world " << count;
    msg.data = ss.str();

    ROS_INFO("%s", msg.data.c_str());
    chatter_pub.publish(msg);
    */

    /*
    tugboat_control::Thrust cmd;
    cmd.ID = 1;
    cmd.thrust = 0;
    cmd.ccwturn = 0;
    cmd_pub.publish(cmd);
    */


    //x: -1.1, y: -0.35 
    //count++;
    
    tugboat_control::Waypoint wayp;
    wayp.ID = 3;
    wayp.x = 1;
    wayp.y = 1;
    wayp.v = 0.05;
    wayp.o = 4;
    wayp_pub.publish(wayp);
    //
    //wayp.ID = 4;
    //wayp_pub.publish(wayp);
//
    /*
    tugboat_control::Waypoint wayp1;
    wayp1.ID = 1;
    wayp1.x = 1;
    wayp1.y = 1;
    wayp1.v = 0.1;
    wayp_pub.publish(wayp1);    
    */
    /*
    tugboat_control::TugSetpoints ctrl;
    ctrl.ID = 3;
    ctrl.o = 0;
    ctrl.force = 5;
    ctrl_pub.publish(ctrl);
    */
    /*
	  tugboat_control::BoatPose pose;
    pose.ID = 0;
    pose.o = 0;
    pose.x = 0;
    pose.y = 0;
    pose_pub.publish(pose);
    */
    //std::cout << (int)cmd.ID << (int)cmd.thrust << (int)cmd.ccwturn << "\n";
//

    //pose_pub.publish(pose);

    ros::spinOnce();
    loop_rate.sleep();
  }


  return 0;
}