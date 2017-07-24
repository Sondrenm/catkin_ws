#include "ros/ros.h"
#include "std_msgs/String.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Thrust.h"
#include "tugboat_control/PushingForce.h"


#include <opencv2/opencv.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>

#include <iostream>
#include <sstream>
#include <unistd.h>
#include <cmath>
#include <vector>

#define numTugs 2
#define friction 1
#define current 0
#define spring 10

#define SHIP_ID 42

#define timestep 0.04
#define m2pix 60
#define rad2deg 57.3

class Boat
{
public:
  uint8_t id;
  int8_t thrust, ccwturn;
  double x, y, o;
  double Vx, Vy, Vr, Fx, Fy, M;
  double mass;
  double rotInertia; 

  void move() {
    // Water resistance: Fd = 1/2 * rho * v² *Cd * A = 0.5 * 1000 * V² * 0.5 * 0.1*0.16 (cross section in water) = 0.004 * v²
    double FxWater = - 4 * Vx * std::abs(Vx);
    double FyWater = - 4 * Vy * std::abs(Vy);
    //Skin drag: F = 1/2 * Cf * rho * v² * S_wetted = 1/2 * Cf * rho * (Vr * r)^2 * 2*pi*r*h_wetted = 0.5*1(?)*1000*Vr²*0.08²*2*pi*0.08*0.1 = 0.08*Vr²
    double MWater = -0.0016 * Vr * abs(Vr);

    double Fthrust = 0.001 * thrust; //TODO: Find const: should be around 100g = 0.1 N -> C ? 0.001? Makes sense
    double FxThrust = Fthrust * cos(o);
    double FyThrust = Fthrust * sin(o);   
    double MThrust = 0.00001 * ccwturn; //TODO: Find const

    //std::cout << "thrust: " << FxThrust << "\n";
    //std::cout << "x: " << x << "\ty: " << y << "\to: " << o << "\n";
    std::cout << "Fx: " << Fx << "\tFxWater: " << FxWater << "\tFxThrust: " << FxThrust << "\tVx: " << Vx << "\n";
    //std::cout << "M: " << M << "\tMWater: " << MWater << "\tMThrust: " << MThrust << "\tVr: " << Vr << "\n";

    Vx += (Fx + FxWater + FxThrust) / mass;
    Vy += (Fy + FyWater + FyThrust) / mass;
    Vr += (M + MWater + MThrust) / rotInertia;
    //std::cout << "Vx: " << Vx << "\tVy: " << Vy << "\tVr: " << Vr << "\n";

    x += Vx * timestep;
    y += Vy * timestep;
    o += Vr * timestep; 
    //normalize
    if(o > 3.14){
      o -= 6.28;
    }
    else if(o < -3.14){
      o += 6.28;
    }

  }
private:
};

class Tugboat: public Boat
{
public:
  double pushingForce = 0;  
  double rad = 0.08;

  void init(uint8_t _id, double _x, double _y, double _o){
    id = _id;
    x = _x;
    y = _y;
    o = _o;

    mass = 0.9;
    rotInertia = 0.032 * mass; // I = 1/2 * m * r² = 0.5*m*0.08² = 0.032*m
  }


  void reset(){
    Fx = 0;
    Fy = 0;
    M = 0;
    pushingForce = 0;
  }

  void draw(cv::Mat& img){
    cv::Point2d center = {m2pix * x, m2pix * y};
    int radius = (int)(m2pix * rad);

    cv::Point2d face = {center.x + (double)(cos(o) * radius), center.y + (double)(sin(o) * radius)};

    cv::circle(img, center, radius, cv::Scalar(255, 255, 255), cv::FILLED, 8, 0);
    cv::line(img, center, face, cv::Scalar(0, 0, 255), 2, 8, 0);
  }
};

class Ship: public Boat
{
public:
//Ship is represented as an elliptic series of points
  double length = 1.5;
  double width = 0.4;

  void init(uint8_t _id, double _x, double _y, double _o){
    id = _id;
    x = _x;
    y = _y;
    o = _o;

    mass = 100;
    rotInertia = 100;
  }

  void reset(){
    Fx = 0;
    Fy = 0;
    M = 0;
  }

  void draw(cv::Mat& img){
    cv::Point2d center = {m2pix * x, m2pix * y};
    cv::Size2d axis = {m2pix * length, m2pix * width};
    
    cv::ellipse(img, center, axis, (double)(rad2deg*o), 0, 360, cv::Scalar(255, 255, 255), 10, 8);
  }
};

std::vector<Tugboat> tug(numTugs);

void thrustCallback(const tugboat_control::Thrust& cmd)
{
  tug[cmd.ID].thrust = cmd.thrust;
  tug[cmd.ID].ccwturn = cmd.ccwturn;
}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "simulation");
  ros::NodeHandle n;

  ros::Subscriber push_sub = n.subscribe("thrust", 1, thrustCallback); //Get positions of all boats from CV

  ros::Publisher pose_pub = n.advertise<tugboat_control::BoatPose>("pose", 1000); //Sends status on detatched tugboats to waypoint manager
  ros::Publisher push_pub = n.advertise<tugboat_control::PushingForce>("pushingForce", 1000); //Sends status on detatched tugboats to waypoint manager

  ros::Rate loop_rate(24);

  //Spawn tugboats and ship
  
  for (uint8_t i = 0; i < numTugs; ++i)
  {
    tug[i].init(i, 0.5, 0.5*(i+1), 0);
  }

  Ship ship;
  ship.init(SHIP_ID, 5, 5, 0);

  //Import blue background image, 1680*1050 pixels
  //1 m = m2pix pixels
  cv::Mat img; // = cv::imread("/home/sondre/catkin_ws/src/tugboat_control/blue.jpg");
  cv::namedWindow("simout", CV_WINDOW_NORMAL);

  //Working variables
  double dx, dy, minDist, dist, overlap, angle, FxCollide, FyCollide, MCollide = 0;
  tugboat_control::BoatPose pose;
  tugboat_control::PushingForce push;

  while (ros::ok())
  {
    //ros::Time begin = ros::Time::now();
    img = cv::Mat::zeros(600, 600, 16); //cv::imread("/home/sondre/catkin_ws/src/tugboat_control/blue.jpg");
    //cv::Mat::cvZero(img);
    //Faster way of showing?
    ship.reset();
    for (int i = 0; i < numTugs; ++i)
    {
      tug[i].reset();
    }

    for (int me = 0; me < numTugs; ++me)
    {
      push.ID = me;
      push.force = 0;
      pose.ID = me;

      //Colide with other tugboats
      for (int you = me + 1; you < numTugs; ++you)
      {
        dx = tug[you].x - tug[me].x;
        dy = tug[you].y - tug[me].y;
        dist = sqrt(dx*dx + dy*dy);
        minDist = tug[you].rad + tug[me].rad;
        if (dist < minDist) { 
          angle = atan2(dy, dx);
          overlap = minDist-dist;

          tug[me].Fx +=  cos(angle) * overlap * spring;
          tug[me].Fy += sin(angle) * overlap * spring;
          //tug[me].M  += sqrt(pow(tug[me].Fx, 2) + pow(tug[me].Fy, 2)) * friction * tug[me].Vr - tug[you].Vr; 

          tug[you].Fx -= tug[me].Fx;
          tug[you].Fy -= tug[me].Fy;
          //tug[you].M  -= tug[me].M;

          //Get pushing force: ind better condition for this
          if(abs(angle - tug[me].o) < 0.35){ //Ca 20 degrees, should be fine
            tug[me].pushingForce += sqrt(pow(tug[me].Fx, 2) + pow(tug[me].Fy, 2));
          }
          
        }
      }
      //collide with ship();

      tug[me].move();
      tug[me].draw(img);

      pose.x = tug[me].x;
      pose.y = tug[me].y;
      pose.o = tug[me].o;

      pose_pub.publish(pose);
      push_pub.publish(push);
    }

    ship.move();

    pose.ID = SHIP_ID;
    pose.x = ship.x;
    pose.y = ship.y;
    pose.o = ship.o;
    pose_pub.publish(pose);

    ship.draw(img);
    cv::imshow("simout", img);
    cv::waitKey(1);
    
    /*
    ros::Time end = ros::Time::now();
    ros::Duration dt = end - begin;
    std::cout << dt << "\n";
*/
    ros::spinOnce();
    loop_rate.sleep();

    
  }
  return 0;
}