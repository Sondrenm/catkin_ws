// Generated by gencpp from file tugboat_control/PushingForce.msg
// DO NOT EDIT!


#ifndef TUGBOAT_CONTROL_MESSAGE_PUSHINGFORCE_H
#define TUGBOAT_CONTROL_MESSAGE_PUSHINGFORCE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tugboat_control
{
template <class ContainerAllocator>
struct PushingForce_
{
  typedef PushingForce_<ContainerAllocator> Type;

  PushingForce_()
    : ID(0)
    , force(0.0)  {
    }
  PushingForce_(const ContainerAllocator& _alloc)
    : ID(0)
    , force(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _ID_type;
  _ID_type ID;

   typedef float _force_type;
  _force_type force;




  typedef boost::shared_ptr< ::tugboat_control::PushingForce_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tugboat_control::PushingForce_<ContainerAllocator> const> ConstPtr;

}; // struct PushingForce_

typedef ::tugboat_control::PushingForce_<std::allocator<void> > PushingForce;

typedef boost::shared_ptr< ::tugboat_control::PushingForce > PushingForcePtr;
typedef boost::shared_ptr< ::tugboat_control::PushingForce const> PushingForceConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tugboat_control::PushingForce_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tugboat_control::PushingForce_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tugboat_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'tugboat_control': ['/home/sondre/catkin_ws/src/tugboat_control/msg', '/home/sondre/catkin_ws/src/tugboat_control/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tugboat_control::PushingForce_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tugboat_control::PushingForce_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugboat_control::PushingForce_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugboat_control::PushingForce_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugboat_control::PushingForce_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugboat_control::PushingForce_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tugboat_control::PushingForce_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a7005a38011551613bbcdafc2f85d46e";
  }

  static const char* value(const ::tugboat_control::PushingForce_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa7005a3801155161ULL;
  static const uint64_t static_value2 = 0x3bbcdafc2f85d46eULL;
};

template<class ContainerAllocator>
struct DataType< ::tugboat_control::PushingForce_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tugboat_control/PushingForce";
  }

  static const char* value(const ::tugboat_control::PushingForce_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tugboat_control::PushingForce_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# From Arduino\n\
uint8 ID\n\
float32 force #in Newton\n\
";
  }

  static const char* value(const ::tugboat_control::PushingForce_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tugboat_control::PushingForce_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.ID);
      stream.next(m.force);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct PushingForce_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tugboat_control::PushingForce_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tugboat_control::PushingForce_<ContainerAllocator>& v)
  {
    s << indent << "ID: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.ID);
    s << indent << "force: ";
    Printer<float>::stream(s, indent + "  ", v.force);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TUGBOAT_CONTROL_MESSAGE_PUSHINGFORCE_H
