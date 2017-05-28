// Generated by gencpp from file tugboat_control/addOneTugResponse.msg
// DO NOT EDIT!


#ifndef TUGBOAT_CONTROL_MESSAGE_ADDONETUGRESPONSE_H
#define TUGBOAT_CONTROL_MESSAGE_ADDONETUGRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <tugboat_control/BoatPose.h>

namespace tugboat_control
{
template <class ContainerAllocator>
struct addOneTugResponse_
{
  typedef addOneTugResponse_<ContainerAllocator> Type;

  addOneTugResponse_()
    : Pose()  {
    }
  addOneTugResponse_(const ContainerAllocator& _alloc)
    : Pose(_alloc)  {
  (void)_alloc;
    }



   typedef  ::tugboat_control::BoatPose_<ContainerAllocator>  _Pose_type;
  _Pose_type Pose;




  typedef boost::shared_ptr< ::tugboat_control::addOneTugResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tugboat_control::addOneTugResponse_<ContainerAllocator> const> ConstPtr;

}; // struct addOneTugResponse_

typedef ::tugboat_control::addOneTugResponse_<std::allocator<void> > addOneTugResponse;

typedef boost::shared_ptr< ::tugboat_control::addOneTugResponse > addOneTugResponsePtr;
typedef boost::shared_ptr< ::tugboat_control::addOneTugResponse const> addOneTugResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tugboat_control::addOneTugResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tugboat_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'tugboat_control': ['/home/sondre/catkin_ws/src/tugboat_control/msg', '/home/sondre/catkin_ws/src/tugboat_control/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tugboat_control::addOneTugResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugboat_control::addOneTugResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugboat_control::addOneTugResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "605a7c6929aec48e81da00e68778ab7c";
  }

  static const char* value(const ::tugboat_control::addOneTugResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x605a7c6929aec48eULL;
  static const uint64_t static_value2 = 0x81da00e68778ab7cULL;
};

template<class ContainerAllocator>
struct DataType< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tugboat_control/addOneTugResponse";
  }

  static const char* value(const ::tugboat_control::addOneTugResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "BoatPose Pose\n\
\n\
================================================================================\n\
MSG: tugboat_control/BoatPose\n\
uint8 ID # ID\n\
float64 x #x position in meters\n\
float64 y #y position in meters\n\
float64 o #orientation in +-pi radians from x-axis\n\
";
  }

  static const char* value(const ::tugboat_control::addOneTugResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.Pose);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct addOneTugResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tugboat_control::addOneTugResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tugboat_control::addOneTugResponse_<ContainerAllocator>& v)
  {
    s << indent << "Pose: ";
    s << std::endl;
    Printer< ::tugboat_control::BoatPose_<ContainerAllocator> >::stream(s, indent + "  ", v.Pose);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TUGBOAT_CONTROL_MESSAGE_ADDONETUGRESPONSE_H
