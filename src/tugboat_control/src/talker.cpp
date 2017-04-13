#include "ros/ros.h"
#include "std_msgs/String.h"
#include "tugboat_control/Thrust.h"
#include "tugboat_control/TugSetpoints.h"
#include "tugboat_control/BoatStatus.h"

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
  //ros::Publisher cmd_pub = n.advertise<tugboat_control::Thrust>("thrust", 1000);
  //ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
	ros::Publisher ctrl_pub = n.advertise<tugboat_control::TugSetpoints>("control", 1000);
	ros::Publisher status_pub = n.advertise<tugboat_control::BoatStatus>("status", 1000);

  ros::Rate loop_rate(10);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
  int count = 0;
  while (ros::ok())
  {
    /**
     * This is a message object. You stuff it with data, and then publish it.
     

    
    std_msgs::String msg;

    std::stringstream ss;
    ss << "hello world " << count;
    msg.data = ss.str();

    ROS_INFO("%s", msg.data.c_str());
    */
    
    //tugboat_control::Thrust cmd;
	//tugboat_control::TugSetpoints ctrl;
	//tugboat_control::BoatStatus status;
//
//
    //ctrl.ID = 1;
    //ctrl.orientation=1;
    //ctrl.pushingForce=50;
//
    //status.ID = 1;
    //status.orientation=0;
    //status.pushingForce=0;
    ////std::cout << (int)cmd.ID << (int)cmd.thrust << (int)cmd.cwturn << "\n";
//
    ////chatter_pub.publish(msg);
    //ctrl_pub.publish(ctrl);
    //status_pub.publish(status);
    //usleep(2000000);
/*
    ctrl.orientation=0;
    ctrl.pushingForce=50;
    ctrl_pub.publish(ctrl);
    usleep(2000000);
*/
    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}