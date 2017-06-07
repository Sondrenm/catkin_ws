#include "ros/ros.h"
#include "tugboat_control/BoatPose.h"
#include "tugboat_control/Waypoint.h"
#include "tugboat_control/TugSetpoints.h"
#include <std_msgs/Float64MultiArray.h>

#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/aruco.hpp>
#include <opencv2/calib3d.hpp>

#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>

#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <math.h>
#include <time.h>

/* <-- Remove/add 1st / to toggle - fix this to use input
#define CAM 0 //Built-in camera - or not? 
/*/
#define CAM 1 //extern camera
//*/
#define OUTPUTMODE true
#define SHIP_ID 0
#define X_OFFSET 1.5
#define Y_OFFSET 1

#define markerLength 0.094 //m

std::vector<tugboat_control::Waypoint> waypoints(7); 
std::vector<bool> inWaypMode(7);
cv::Mat videoImg, boatPosImg;
std::vector<cv::Scalar> colour(7);
std_msgs::Float64MultiArray shipFrame;
int framesSinceLastDrawMsg = 0;


static bool readCameraParameters(cv::Mat &camMatrix, cv::Mat &distCoeffs) {
    std::string filename;
    if(CAM == 1){
      filename = "/home/sondre/catkin_ws/src/tugboat_control/cameraParametersUSB";
    }
    else {
      filename = "/home/sondre/catkin_ws/src/tugboat_control/cameraParameters";
    }
    cv::FileStorage fs(filename, cv::FileStorage::READ);
    if(!fs.isOpened())
        return false;
    fs["camera_matrix"] >> camMatrix;
    fs["distortion_coefficients"] >> distCoeffs;
    return true;
}

/*
 double rotationMatrixToEulerAngles2D(cv::Mat *R)
{
    double sy = sqrt(R.at<double>(0,0) * R.at<double>(0,0) +  R.at<double>(1,0) * R.at<double>(1,0) );
    bool singular = sy < 1e-6;
    double o;

    if (!singular) {
        o = atan2(R.at<double>(1,0), R.at<double>(0,0));
    }
    else {
        o = 0;
    }
    return o; 
}*/


 double rotationMatrixToEulerAngles2D(cv::Mat *R)
{
    double sy = sqrt(R->at<double>(0,0) * R->at<double>(0,0) +  R->at<double>(1,0) * R->at<double>(1,0) );
    bool singular = sy < 1e-6;
    double o;

    if (!singular) {
        o = atan2(R->at<double>(1,0), R->at<double>(0,0));
    }
    else {
        o = 0;
    }
    return o; 
}

void waypCallback(const tugboat_control::Waypoint::ConstPtr& waypIn)
{
  waypoints[(int)waypIn->ID] = *waypIn;
  inWaypMode[(int)waypIn->ID] = true;
}

void shipWaypCallback(const tugboat_control::Waypoint::ConstPtr& wayp_in)
{
   waypoints[0] = *wayp_in;
}

void ctrlCallback(const tugboat_control::TugSetpoints::ConstPtr& ctrl_in)
{
  inWaypMode[(int)ctrl_in->ID] = false;
}

void drawShipCallback(const std_msgs::Float64MultiArray::ConstPtr &msg)
{
  shipFrame = *msg;
  framesSinceLastDrawMsg = 0;
  std::cout << "new Drawmsg\n";
}

void drawShip()
{
  if(shipFrame.data.size() != 8 || framesSinceLastDrawMsg > 10)
  {
    return;
  }
  framesSinceLastDrawMsg++;
  std::vector<cv::Point> pts;
  int i = 0;
  while ( i < shipFrame.data.size()-1)
  {
    pts.push_back(cv::Point(shipFrame.data[i], shipFrame.data[i+1]));
    i+=2;
  }
  int npts = cv::Mat(pts).rows;
  const cv::Point *pts_ptr = (const cv::Point*) cv::Mat(pts).data;
  polylines(videoImg, &pts_ptr, &npts, 1, true, colour[0], 2, 8, 0);
}

void saveImage(cv::Mat *img)
{
  std::cout << "Saving image\n";
  time_t rawtime;
  struct tm * timeinfo;
  char timeString [80];
  time(&rawtime);
  timeinfo = localtime(&rawtime);
  strftime(timeString, 80, "%d.%m_%H:%M:%S", timeinfo);
  std::string part1 = "tugPosImg_";
  std::string jpg = ".jpg";
  std::string name = part1 + timeString + jpg;
  cv::imwrite(name, *img);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "CV");
  ros::NodeHandle n;
  ros::Publisher tug_pub = n.advertise<tugboat_control::BoatPose>("pose", 100);
  ros::Publisher ship_pub = n.advertise<tugboat_control::BoatPose>("shipPose", 1);

  ros::Subscriber shipWayp_sub = n.subscribe("shipWaypoint", 1, shipWaypCallback);
  ros::Subscriber wayp_sub = n.subscribe("waypoint", 100, waypCallback);
  ros::Subscriber ctrl_sub = n.subscribe("control", 100, ctrlCallback);
  ros::Subscriber drawShip_sub = n.subscribe("drawShip", 100, drawShipCallback);

  ros::Rate loop_rate(10);

  tugboat_control::BoatPose boat;

  //CV init
  cv::VideoCapture capWebcam(CAM);
  cv::Mat cameraMatrix, distCoeffs, rotation3x3;

  if (capWebcam.isOpened() == false) {
    std::cout << "error: Webcam not accessed successfully\n\n";
    return(0);
  }

  cv::Ptr<cv::aruco::Dictionary> dictionary = cv::aruco::getPredefinedDictionary(cv::aruco::DICT_4X4_50);
  std::vector< int > markerIds;
  std::vector< std::vector< cv::Point2f > > markerCorners;
  std::vector< cv::Vec3d > rvecs, tvecs;
  cv::aruco::DetectorParameters parameters; //Might want to change these?
  
  bool readOk = readCameraParameters(cameraMatrix, distCoeffs);
  if(!readOk) {
      std::cout << "Invalid camera file\n";
      return 0;
  }
  
  std::cout << "CV node initialized successfully\n";

  //This image is used to present boats' movement in thesis
  capWebcam.read(boatPosImg);
  //Each bot has its own colour
//  std::vector<cv::Scalar> colour(7);
  colour[0] = cv::Scalar(  0,   0, 255);
  colour[1] = cv::Scalar(  0, 255, 0  );
  colour[2] = cv::Scalar(255,   0, 0  );
  colour[3] = cv::Scalar(  0, 255, 255);
  colour[4] = cv::Scalar(255,   0, 255);
  colour[5] = cv::Scalar(255, 255, 0  );
  colour[6] = cv::Scalar(  0, 100, 0  );
  int counter = 0;

  while (ros::ok() && capWebcam.isOpened() )
  {
    counter++;
    if(capWebcam.read(videoImg))
    { //Camera capture successful
      cv::aruco::detectMarkers(videoImg, dictionary, markerCorners, markerIds); 
      
      if (markerIds.size() > 0)
      { //At least one aruco marker found
        cv::aruco::estimatePoseSingleMarkers(markerCorners, markerLength, cameraMatrix, distCoeffs, rvecs, tvecs);
        
        if(OUTPUTMODE)
        {
          cv::aruco::drawDetectedMarkers(videoImg, markerCorners, markerIds);
        }
        
        for(int i=0; i<markerIds.size(); i++)
        {
          if(OUTPUTMODE)
          { // Drawing functions
            cv::aruco::drawAxis(videoImg, cameraMatrix, distCoeffs, rvecs[i], tvecs[i], markerLength * 0.5f);

            cv::Point2d tugPt = cv::Point2d((tvecs[i][0] + X_OFFSET) * 220, (tvecs[i][1] + Y_OFFSET) * 220);
            cv::circle(boatPosImg, tugPt, 2, colour[markerIds[i]], 3, 8, 0);

            if(waypoints[markerIds[i]].x > 0.001 && inWaypMode[markerIds[i]])
            { //Draw line from boat to waypoint in output image
              cv::Point2d waypPt = cv::Point(waypoints[markerIds[i]].x * 220, waypoints[markerIds[i]].y * 220);
              cv::arrowedLine(videoImg, tugPt, waypPt, colour[markerIds[i]], 2, 8, 0, 0.03); //TODO: Stop drawing waypoint line when tugboat enters ctrlMode
              //Draw circle at waypoint in documentation image
              if(!(counter % 100) ) 
              { //Draw waypoint every 10 sec
                cv::circle(boatPosImg, waypPt, 20, colour[markerIds[i]], 2, 8, 0); //first int is radius - should be about one tugboat size
              }
            }
          }

          //Transform rvec to 2D orientation
          cv::Rodrigues(rvecs[i], rotation3x3);
          double orientation = rotationMatrixToEulerAngles2D(&rotation3x3);

          boat.ID = (uint8_t)markerIds[i];
          //x and y assumes corner is at tugboat center
          boat.x = tvecs[i][0] + X_OFFSET;
          boat.y = tvecs[i][1] + Y_OFFSET;
          boat.o = orientation;
          if(boat.ID == SHIP_ID)
          {
            ship_pub.publish(boat);
          } 
          else 
          {
            tug_pub.publish(boat);
          }
        }
      }
    }

    drawShip();
    //For debugging
    cv::namedWindow("pos", CV_WINDOW_NORMAL);
    cv::imshow("pos", boatPosImg);

    cv::namedWindow("out", CV_WINDOW_NORMAL); //TODO: Make window appear nicely
    cv::imshow("out", videoImg);
    cv::moveWindow("out", 400, 1100);

    int key = cv::waitKey(1);

    switch(key)
    {
      case 27: //Esc
      {
        saveImage(&boatPosImg);
        return 0;
      }
      case 32: //Spacebar
      {
        saveImage(&boatPosImg);
        break;
      }
      case 99: //c for "capture"
      {
        saveImage(&videoImg);
        break;
      }
      case 114: //r for "reset"
      {
        while(!capWebcam.read(boatPosImg)){}
        break;
      }
    }

    ros::spinOnce();
    loop_rate.sleep();
  }

  saveImage(&boatPosImg);


  return 0;
}