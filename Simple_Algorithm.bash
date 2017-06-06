#!/bin/bash

#WIDTHxHEIGHT+XOFF+YOFF
v4l2-ctl -d /dev/video1 -c focus_auto=0
v4l2-ctl -d /dev/video1 -c focus_absolute=2
gnome-terminal -e roscore --geometry 60x10+0+0
sleep 1
gnome-terminal --geometry 60x10+0+220 -e "rosrun tugboat_control TugManager"
gnome-terminal --geometry 60x10+0+420 -e "rosrun tugboat_control ShipControl_Simple"
gnome-terminal --geometry 60x10+620+820 -e "rosrun tugboat_control CV"
sleep 1
#gnome-terminal --geometry 60x10+0+620 -e "rosrun tugboat_control WaypointDummy"
gnome-terminal --geometry 60x10+0+620 -e "roslaunch master demo.launch"
sleep 1
gnome-terminal --geometry 60x10+0+820 -e "rosrun tugboat_control TugController _ID:=1 __name:=ctrl1"
gnome-terminal --geometry 60x10+0+820 -e "rosrun tugboat_control TugController _ID:=2 __name:=ctrl2"
#gnome-terminal --geometry 60x10+0+820 -e "rosrun tugboat_control TugController _ID:=3 __name:=ctrl3"
gnome-terminal --geometry 60x10+0+820 -e "rosrun tugboat_control TugController _ID:=4 __name:=ctrl4"
#gnome-terminal --geometry 60x10+0+820 -e "rosrun tugboat_control TugController _ID:=5 __name:=ctrl5"
gnome-terminal --geometry 60x10+0+820 -e "rosrun tugboat_control TugController _ID:=6 __name:=ctrl6"

gnome-terminal --geometry 60x10+620+420 -e "rosrun rosserial_python serial_node.py /dev/ttyUSB0 __name:=USB0" #Radio rx/tx
gnome-terminal --geometry 60x10+620+620 -e "rosrun rosserial_python serial_node.py /dev/ttyUSB1 __name:=USB1" #Radio rx/tx
gnome-terminal --geometry 20x20+620+0 -e "rostopic echo /pose"
gnome-terminal --geometry 20x20+820+0 -e "rostopic echo /thrust"
gnome-terminal --geometry 20x20+1020+0 -e "rostopic echo /pushingForce"
gnome-terminal --geometry 20x20+1220+0 -e "rostopic echo /waypoint"
gnome-terminal --geometry 20x20+1420+0 -e "rostopic echo /control"
gnome-terminal --geometry 20x20+1620+0 -e "rostopic echo /waypointRequest"
gnome-terminal --geometry 20x20+1220+400 -e "rostopic echo /clearWaypoint"

