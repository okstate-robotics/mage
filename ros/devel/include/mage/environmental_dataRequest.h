// Generated by gencpp from file mage/environmental_dataRequest.msg
// DO NOT EDIT!


#ifndef MAGE_MESSAGE_ENVIRONMENTAL_DATAREQUEST_H
#define MAGE_MESSAGE_ENVIRONMENTAL_DATAREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mage
{
template <class ContainerAllocator>
struct environmental_dataRequest_
{
  typedef environmental_dataRequest_<ContainerAllocator> Type;

  environmental_dataRequest_()
    : p_x(0.0)
    , p_y(0.0)
    , p_z(0.0)  {
    }
  environmental_dataRequest_(const ContainerAllocator& _alloc)
    : p_x(0.0)
    , p_y(0.0)
    , p_z(0.0)  {
    }



   typedef double _p_x_type;
  _p_x_type p_x;

   typedef double _p_y_type;
  _p_y_type p_y;

   typedef double _p_z_type;
  _p_z_type p_z;




  typedef boost::shared_ptr< ::mage::environmental_dataRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mage::environmental_dataRequest_<ContainerAllocator> const> ConstPtr;

}; // struct environmental_dataRequest_

typedef ::mage::environmental_dataRequest_<std::allocator<void> > environmental_dataRequest;

typedef boost::shared_ptr< ::mage::environmental_dataRequest > environmental_dataRequestPtr;
typedef boost::shared_ptr< ::mage::environmental_dataRequest const> environmental_dataRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mage::environmental_dataRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mage::environmental_dataRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mage

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg'], 'mage': ['/home/daslab-server1/Rakshit/ros/src/mage/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mage::environmental_dataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mage::environmental_dataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mage::environmental_dataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mage::environmental_dataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mage::environmental_dataRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mage::environmental_dataRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mage::environmental_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9ea0a2c39d74f5e0ed88af8b9342cf5b";
  }

  static const char* value(const ::mage::environmental_dataRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9ea0a2c39d74f5e0ULL;
  static const uint64_t static_value2 = 0xed88af8b9342cf5bULL;
};

template<class ContainerAllocator>
struct DataType< ::mage::environmental_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mage/environmental_dataRequest";
  }

  static const char* value(const ::mage::environmental_dataRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mage::environmental_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 p_x\n\
float64 p_y\n\
float64 p_z\n\
";
  }

  static const char* value(const ::mage::environmental_dataRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mage::environmental_dataRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.p_x);
      stream.next(m.p_y);
      stream.next(m.p_z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct environmental_dataRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mage::environmental_dataRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mage::environmental_dataRequest_<ContainerAllocator>& v)
  {
    s << indent << "p_x: ";
    Printer<double>::stream(s, indent + "  ", v.p_x);
    s << indent << "p_y: ";
    Printer<double>::stream(s, indent + "  ", v.p_y);
    s << indent << "p_z: ";
    Printer<double>::stream(s, indent + "  ", v.p_z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAGE_MESSAGE_ENVIRONMENTAL_DATAREQUEST_H
