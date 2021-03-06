// Generated by gencpp from file tugboat_control/WaypointAvailableResponse.msg
// DO NOT EDIT!


#ifndef TUGBOAT_CONTROL_MESSAGE_WAYPOINTAVAILABLERESPONSE_H
#define TUGBOAT_CONTROL_MESSAGE_WAYPOINTAVAILABLERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Bool.h>

namespace tugboat_control
{
template <class ContainerAllocator>
struct WaypointAvailableResponse_
{
  typedef WaypointAvailableResponse_<ContainerAllocator> Type;

  WaypointAvailableResponse_()
    : ans()  {
    }
  WaypointAvailableResponse_(const ContainerAllocator& _alloc)
    : ans(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Bool_<ContainerAllocator>  _ans_type;
  _ans_type ans;




  typedef boost::shared_ptr< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> const> ConstPtr;

}; // struct WaypointAvailableResponse_

typedef ::tugboat_control::WaypointAvailableResponse_<std::allocator<void> > WaypointAvailableResponse;

typedef boost::shared_ptr< ::tugboat_control::WaypointAvailableResponse > WaypointAvailableResponsePtr;
typedef boost::shared_ptr< ::tugboat_control::WaypointAvailableResponse const> WaypointAvailableResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b2020b919eb112b1b4fe9db01673724e";
  }

  static const char* value(const ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb2020b919eb112b1ULL;
  static const uint64_t static_value2 = 0xb4fe9db01673724eULL;
};

template<class ContainerAllocator>
struct DataType< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tugboat_control/WaypointAvailableResponse";
  }

  static const char* value(const ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Bool ans\n\
\n\
================================================================================\n\
MSG: std_msgs/Bool\n\
bool data\n\
";
  }

  static const char* value(const ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.ans);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WaypointAvailableResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tugboat_control::WaypointAvailableResponse_<ContainerAllocator>& v)
  {
    s << indent << "ans: ";
    s << std::endl;
    Printer< ::std_msgs::Bool_<ContainerAllocator> >::stream(s, indent + "  ", v.ans);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TUGBOAT_CONTROL_MESSAGE_WAYPOINTAVAILABLERESPONSE_H
