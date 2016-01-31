// Generated by gencpp from file mage/navigation_dataRequest.msg
// DO NOT EDIT!


#ifndef MAGE_MESSAGE_NAVIGATION_DATAREQUEST_H
#define MAGE_MESSAGE_NAVIGATION_DATAREQUEST_H


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
struct navigation_dataRequest_
{
  typedef navigation_dataRequest_<ContainerAllocator> Type;

  navigation_dataRequest_()
    : P_x(0.0)
    , P_y(0.0)
    , P_z(0.0)  {
    }
  navigation_dataRequest_(const ContainerAllocator& _alloc)
    : P_x(0.0)
    , P_y(0.0)
    , P_z(0.0)  {
    }



   typedef double _P_x_type;
  _P_x_type P_x;

   typedef double _P_y_type;
  _P_y_type P_y;

   typedef double _P_z_type;
  _P_z_type P_z;




  typedef boost::shared_ptr< ::mage::navigation_dataRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mage::navigation_dataRequest_<ContainerAllocator> const> ConstPtr;

}; // struct navigation_dataRequest_

typedef ::mage::navigation_dataRequest_<std::allocator<void> > navigation_dataRequest;

typedef boost::shared_ptr< ::mage::navigation_dataRequest > navigation_dataRequestPtr;
typedef boost::shared_ptr< ::mage::navigation_dataRequest const> navigation_dataRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mage::navigation_dataRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mage::navigation_dataRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::mage::navigation_dataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mage::navigation_dataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mage::navigation_dataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mage::navigation_dataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mage::navigation_dataRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mage::navigation_dataRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mage::navigation_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4676fdac6556dac367c0e950a8916bb4";
  }

  static const char* value(const ::mage::navigation_dataRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4676fdac6556dac3ULL;
  static const uint64_t static_value2 = 0x67c0e950a8916bb4ULL;
};

template<class ContainerAllocator>
struct DataType< ::mage::navigation_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mage/navigation_dataRequest";
  }

  static const char* value(const ::mage::navigation_dataRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mage::navigation_dataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 P_x\n\
float64 P_y\n\
float64 P_z\n\
";
  }

  static const char* value(const ::mage::navigation_dataRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mage::navigation_dataRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.P_x);
      stream.next(m.P_y);
      stream.next(m.P_z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct navigation_dataRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mage::navigation_dataRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mage::navigation_dataRequest_<ContainerAllocator>& v)
  {
    s << indent << "P_x: ";
    Printer<double>::stream(s, indent + "  ", v.P_x);
    s << indent << "P_y: ";
    Printer<double>::stream(s, indent + "  ", v.P_y);
    s << indent << "P_z: ";
    Printer<double>::stream(s, indent + "  ", v.P_z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAGE_MESSAGE_NAVIGATION_DATAREQUEST_H
