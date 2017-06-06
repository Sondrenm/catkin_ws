#!/bin/bash

#WIDTHxHEIGHT+XOFF+YOFF
gnome-terminal -e roscore --geometry 60x10+0+0
sleep 1
gnome-terminal --geometry 60x10+0+220 -e "rosrun tugboat_control CV"
gnome-terminal --geometry 60x10+0+420 -e "rosrun tugboat_control TugController _ID:=2"
gnome-terminal --geometry 60x10+0+620 -e "rosrun tugboat_control talker"
gnome-terminal --geometry 60x10+620+420 -e "rosrun rosserial_python serial_node.py /dev/ttyUSB0" #Radio rx/tx
gnome-terminal --geometry 60x10+620+620 -e "rosrun rosserial_python serial_node.py /dev/ttyUSB1 __name:=USB1" #Radio rx/tx
gnome-terminal --geometry 20x20+620+0 -e "rostopic echo /pose"
gnome-terminal --geometry 20x20+820+0 -e "rostopic echo /thrust"
gnome-terminal --geometry 20x20+1000+0 -e "rostopic echo /pushingForce"
gnome-terminal --geometry 20x20+1180+0 -e "rostopic echo /waypoint"

v4l2-ctl -d /dev/video1 -c focus_auto=0
v4l2-ctl -d /dev/video1 -c focus_absolute=2