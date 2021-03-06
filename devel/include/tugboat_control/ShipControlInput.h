// Generated by gencpp from file tugboat_control/ShipControlInput.msg
// DO NOT EDIT!


#ifndef TUGBOAT_CONTROL_MESSAGE_SHIPCONTROLINPUT_H
#define TUGBOAT_CONTROL_MESSAGE_SHIPCONTROLINPUT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <tugboat_control/BoatPose.h>
#include <tugboat_control/TugStatus.h>

namespace tugboat_control
{
template <class ContainerAllocator>
struct ShipControlInput_
{
  typedef ShipControlInput_<ContainerAllocator> Type;

  ShipControlInput_()
    : ShipPose()
    , TugStatus()  {
    }
  ShipControlInput_(const ContainerAllocator& _alloc)
    : ShipPose(_alloc)
    , TugStatus(_alloc)  {
  (void)_alloc;
    }



   typedef  ::tugboat_control::BoatPose_<ContainerAllocator>  _ShipPose_type;
  _ShipPose_type ShipPose;

   typedef std::vector< ::tugboat_control::TugStatus_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::tugboat_control::TugStatus_<ContainerAllocator> >::other >  _TugStatus_type;
  _TugStatus_type TugStatus;




  typedef boost::shared_ptr< ::tugboat_control::ShipControlInput_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tugboat_control::ShipControlInput_<ContainerAllocator> const> ConstPtr;

}; // struct ShipControlInput_

typedef ::tugboat_control::ShipControlInput_<std::allocator<void> > ShipControlInput;

typedef boost::shared_ptr< ::tugboat_control::ShipControlInput > ShipControlInputPtr;
typedef boost::shared_ptr< ::tugboat_control::ShipControlInput const> ShipControlInputConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tugboat_control::ShipControlInput_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tugboat_control::ShipControlInput_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tugboat_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'tugboat_control': ['/home/sondre/catkin_ws/src/tugboat_control/msg', '/home/sondre/catkin_ws/src/tugboat_control/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tugboat_control::ShipControlInput_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tugboat_control::ShipControlInput_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugboat_control::ShipControlInput_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugboat_control::ShipControlInput_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugboat_control::ShipControlInput_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugboat_control::ShipControlInput_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tugboat_control::ShipControlInput_<ContainerAllocator> >
{
  static const char* value()
  {
    return "945e5ec50a8c1a88de62ff9741f9d15f";
  }

  static const char* value(const ::tugboat_control::ShipControlInput_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x945e5ec50a8c1a88ULL;
  static const uint64_t static_value2 = 0xde62ff9741f9d15fULL;
};

template<class ContainerAllocator>
struct DataType< ::tugboat_control::ShipControlInput_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tugboat_control/ShipControlInput";
  }

  static const char* value(const ::tugboat_control::ShipControlInput_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tugboat_control::ShipControlInput_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#What information is pertinent for controller??\n\
tugboat_control/BoatPose ShipPose\n\
tugboat_control/TugStatus[] TugStatus\n\
================================================================================\n\
MSG: tugboat_control/BoatPose\n\
float64 timestamp\n\
geometry_msgs/Pose2D[11] Pose\n\
================================================================================\n\
MSG: geometry_msgs/Pose2D\n\
# This expresses a position and orientation on a 2D manifold.\n\
\n\
float64 x\n\
float64 y\n\
float64 theta\n\
================================================================================\n\
MSG: tugboat_control/TugStatus\n\
uint8[] ID # ID > 99 indicates ship\n\
float64 x #x position in meters\n\
float64 y #y position in meters\n\
float64 theta #orientation in radians or degrees?\n\
float32 PushingForce # Newton\n\
";
  }

  static const char* value(const ::tugboat_control::ShipControlInput_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tugboat_control::ShipControlInput_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.ShipPose);
      stream.next(m.TugStatus);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct ShipControlInput_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tugboat_control::ShipControlInput_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tugboat_control::ShipControlInput_<ContainerAllocator>& v)
  {
    s << indent << "ShipPose: ";
    s << std::endl;
    Printer< ::tugboat_control::BoatPose_<ContainerAllocator> >::stream(s, indent + "  ", v.ShipPose);
    s << indent << "TugStatus[]" << std::endl;
    for (size_t i = 0; i < v.TugStatus.size(); ++i)
    {
      s << indent << "  TugStatus[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::tugboat_control::TugStatus_<ContainerAllocator> >::stream(s, indent + "    ", v.TugStatus[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TUGBOAT_CONTROL_MESSAGE_SHIPCONTROLINPUT_H
