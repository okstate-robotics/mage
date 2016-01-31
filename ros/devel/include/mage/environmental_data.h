// Generated by gencpp from file mage/environmental_data.msg
// DO NOT EDIT!


#ifndef MAGE_MESSAGE_ENVIRONMENTAL_DATA_H
#define MAGE_MESSAGE_ENVIRONMENTAL_DATA_H

#include <ros/service_traits.h>


#include <mage/environmental_dataRequest.h>
#include <mage/environmental_dataResponse.h>


namespace mage
{

struct environmental_data
{

typedef environmental_dataRequest Request;
typedef environmental_dataResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct environmental_data
} // namespace mage


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mage::environmental_data > {
  static const char* value()
  {
    return "464dd2a90344e508756fa891a7a63652";
  }

  static const char* value(const ::mage::environmental_data&) { return value(); }
};

template<>
struct DataType< ::mage::environmental_data > {
  static const char* value()
  {
    return "mage/environmental_data";
  }

  static const char* value(const ::mage::environmental_data&) { return value(); }
};


// service_traits::MD5Sum< ::mage::environmental_dataRequest> should match 
// service_traits::MD5Sum< ::mage::environmental_data > 
template<>
struct MD5Sum< ::mage::environmental_dataRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mage::environmental_data >::value();
  }
  static const char* value(const ::mage::environmental_dataRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mage::environmental_dataRequest> should match 
// service_traits::DataType< ::mage::environmental_data > 
template<>
struct DataType< ::mage::environmental_dataRequest>
{
  static const char* value()
  {
    return DataType< ::mage::environmental_data >::value();
  }
  static const char* value(const ::mage::environmental_dataRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mage::environmental_dataResponse> should match 
// service_traits::MD5Sum< ::mage::environmental_data > 
template<>
struct MD5Sum< ::mage::environmental_dataResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mage::environmental_data >::value();
  }
  static const char* value(const ::mage::environmental_dataResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mage::environmental_dataResponse> should match 
// service_traits::DataType< ::mage::environmental_data > 
template<>
struct DataType< ::mage::environmental_dataResponse>
{
  static const char* value()
  {
    return DataType< ::mage::environmental_data >::value();
  }
  static const char* value(const ::mage::environmental_dataResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MAGE_MESSAGE_ENVIRONMENTAL_DATA_H
