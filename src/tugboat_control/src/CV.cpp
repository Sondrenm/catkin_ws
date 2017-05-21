#include "ros/ros.h"
#include "tugboat_control/BoatPose.h"

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

/* <-- Remove/add 1st / to toggle - fix this to use input
#define CAM 0 //Built-in camera - or not? 
/*/
#define CAM 1 //extern camera
//*/
#define OUTPUTMODE true
#define SHIP_ID 4
#define X_OFFSET 1.5
#define Y_OFFSET 1

#define markerLength 0.094 //m

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

 double rotationMatrixToEulerAngles2D(cv::Mat &R)
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
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "CV");
  ros::NodeHandle n;
  ros::Publisher tug_pub = n.advertise<tugboat_control::BoatPose>("pose", 100);
  ros::Publisher ship_pub = n.advertise<tugboat_control::BoatPose>("shipPose", 1);
  ros::Rate loop_rate(10);

  tugboat_control::BoatPose boat;

  //CV init
  cv::VideoCapture capWebcam(CAM);
  cv::Mat videoImg, cameraMatrix, distCoeffs, rotation3x3;

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

  while (ros::ok() && capWebcam.isOpened() )
  {
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
          if(OUTPUTMODE){
            cv::aruco::drawAxis(videoImg, cameraMatrix, distCoeffs, rvecs[i], tvecs[i], markerLength * 0.5f);
          }

          //Transform rvec to 2D orientation
          cv::Rodrigues(rvecs[i], rotation3x3);
          double orientation = rotationMatrixToEulerAngles2D(rotation3x3);

          boat.ID = (uint8_t)markerIds[i];
          //x and y assumes corner is at tugboat center
          boat.x = tvecs[i][0] + X_OFFSET;
          boat.y = tvecs[i][1] + Y_OFFSET;
          boat.o = orientation;
          if(boat.ID == SHIP_ID){
            ship_pub.publish(boat);
            //tug_pub.publish(boat); //TODO: Not sure if this is needed, check with Rebecca
          } else {
            tug_pub.publish(boat);
          }
        }
      }
    }

    cv::namedWindow("out", CV_WINDOW_NORMAL); //TODO: Make window appear nicely
    cv::imshow("out", videoImg);
    cv::waitKey(1);

    ros::spinOnce();
    loop_rate.sleep();
  }


  return 0;
}