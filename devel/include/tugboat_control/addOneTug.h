// Generated by gencpp from file tugboat_control/addOneTug.msg
// DO NOT EDIT!


#ifndef TUGBOAT_CONTROL_MESSAGE_ADDONETUG_H
#define TUGBOAT_CONTROL_MESSAGE_ADDONETUG_H

#include <ros/service_traits.h>


#include <tugboat_control/addOneTugRequest.h>
#include <tugboat_control/addOneTugResponse.h>


namespace tugboat_control
{

struct addOneTug
{

typedef addOneTugRequest Request;
typedef addOneTugResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct addOneTug
} // namespace tugboat_control


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::tugboat_control::addOneTug > {
  static const char* value()
  {
    return "605a7c6929aec48e81da00e68778ab7c";
  }

  static const char* value(const ::tugboat_control::addOneTug&) { return value(); }
};

template<>
struct DataType< ::tugboat_control::addOneTug > {
  static const char* value()
  {
    return "tugboat_control/addOneTug";
  }

  static const char* value(const ::tugboat_control::addOneTug&) { return value(); }
};


// service_traits::MD5Sum< ::tugboat_control::addOneTugRequest> should match 
// service_traits::MD5Sum< ::tugboat_control::addOneTug > 
template<>
struct MD5Sum< ::tugboat_control::addOneTugRequest>
{
  static const char* value()
  {
    return MD5Sum< ::tugboat_control::addOneTug >::value();
  }
  static const char* value(const ::tugboat_control::addOneTugRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::tugboat_control::addOneTugRequest> should match 
// service_traits::DataType< ::tugboat_control::addOneTug > 
template<>
struct DataType< ::tugboat_control::addOneTugRequest>
{
  static const char* value()
  {
    return DataType< ::tugboat_control::addOneTug >::value();
  }
  static const char* value(const ::tugboat_control::addOneTugRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::tugboat_control::addOneTugResponse> should match 
// service_traits::MD5Sum< ::tugboat_control::addOneTug > 
template<>
struct MD5Sum< ::tugboat_control::addOneTugResponse>
{
  static const char* value()
  {
    return MD5Sum< ::tugboat_control::addOneTug >::value();
  }
  static const char* value(const ::tugboat_control::addOneTugResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::tugboat_control::addOneTugResponse> should match 
// service_traits::DataType< ::tugboat_control::addOneTug > 
template<>
struct DataType< ::tugboat_control::addOneTugResponse>
{
  static const char* value()
  {
    return DataType< ::tugboat_control::addOneTug >::value();
  }
  static const char* value(const ::tugboat_control::addOneTugResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TUGBOAT_CONTROL_MESSAGE_ADDONETUG_H