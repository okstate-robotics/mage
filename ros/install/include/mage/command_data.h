// Generated by gencpp from file mage/command_data.msg
// DO NOT EDIT!


#ifndef MAGE_MESSAGE_COMMAND_DATA_H
#define MAGE_MESSAGE_COMMAND_DATA_H


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
struct command_data_
{
  typedef command_data_<ContainerAllocator> Type;

  command_data_()
    : aileron(0.0)
    , elevator(0.0)
    , rudder(0.0)
    , throttle(0.0)
    , reached(0.0)  {
    }
  command_data_(const ContainerAllocator& _alloc)
    : aileron(0.0)
    , elevator(0.0)
    , rudder(0.0)
    , throttle(0.0)
    , reached(0.0)  {
    }



   typedef float _aileron_type;
  _aileron_type aileron;

   typedef float _elevator_type;
  _elevator_type elevator;

   typedef float _rudder_type;
  _rudder_type rudder;

   typedef float _throttle_type;
  _throttle_type throttle;

   typedef float _reached_type;
  _reached_type reached;




  typedef boost::shared_ptr< ::mage::command_data_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mage::command_data_<ContainerAllocator> const> ConstPtr;

}; // struct command_data_

typedef ::mage::command_data_<std::allocator<void> > command_data;

typedef boost::shared_ptr< ::mage::command_data > command_dataPtr;
typedef boost::shared_ptr< ::mage::command_data const> command_dataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mage::command_data_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mage::command_data_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::mage::command_data_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mage::command_data_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mage::command_data_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mage::command_data_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mage::command_data_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mage::command_data_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mage::command_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "978bbee7b543b076983d5ef9268c14b8";
  }

  static const char* value(const ::mage::command_data_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x978bbee7b543b076ULL;
  static const uint64_t static_value2 = 0x983d5ef9268c14b8ULL;
};

template<class ContainerAllocator>
struct DataType< ::mage::command_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mage/command_data";
  }

  static const char* value(const ::mage::command_data_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mage::command_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 aileron\n\
float32 elevator\n\
float32 rudder\n\
float32 throttle\n\
float32 reached\n\
";
  }

  static const char* value(const ::mage::command_data_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mage::command_data_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.aileron);
      stream.next(m.elevator);
      stream.next(m.rudder);
      stream.next(m.throttle);
      stream.next(m.reached);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct command_data_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mage::command_data_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mage::command_data_<ContainerAllocator>& v)
  {
    s << indent << "aileron: ";
    Printer<float>::stream(s, indent + "  ", v.aileron);
    s << indent << "elevator: ";
    Printer<float>::stream(s, indent + "  ", v.elevator);
    s << indent << "rudder: ";
    Printer<float>::stream(s, indent + "  ", v.rudder);
    s << indent << "throttle: ";
    Printer<float>::stream(s, indent + "  ", v.throttle);
    s << indent << "reached: ";
    Printer<float>::stream(s, indent + "  ", v.reached);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAGE_MESSAGE_COMMAND_DATA_H
