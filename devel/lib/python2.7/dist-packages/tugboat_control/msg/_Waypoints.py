# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tugboat_control/Waypoints.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import tugboat_control.msg

class Waypoints(genpy.Message):
  _md5sum = "2e23614a1124366d2fd6f1fe04468ba7"
  _type = "tugboat_control/Waypoints"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """Waypoint[] data
================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation"""
  __slots__ = ['data']
  _slot_types = ['tugboat_control/Waypoint[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       data

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Waypoints, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.data is None:
        self.data = []
    else:
      self.data = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.data)
      buff.write(_struct_I.pack(length))
      for val1 in self.data:
        _x = val1
        buff.write(_get_struct_B4d().pack(_x.ID, _x.x, _x.y, _x.v, _x.o))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.data is None:
        self.data = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.data = []
      for i in range(0, length):
        val1 = tugboat_control.msg.Waypoint()
        _x = val1
        start = end
        end += 33
        (_x.ID, _x.x, _x.y, _x.v, _x.o,) = _get_struct_B4d().unpack(str[start:end])
        self.data.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.data)
      buff.write(_struct_I.pack(length))
      for val1 in self.data:
        _x = val1
        buff.write(_get_struct_B4d().pack(_x.ID, _x.x, _x.y, _x.v, _x.o))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.data is None:
        self.data = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.data = []
      for i in range(0, length):
        val1 = tugboat_control.msg.Waypoint()
        _x = val1
        start = end
        end += 33
        (_x.ID, _x.x, _x.y, _x.v, _x.o,) = _get_struct_B4d().unpack(str[start:end])
        self.data.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B4d = None
def _get_struct_B4d():
    global _struct_B4d
    if _struct_B4d is None:
        _struct_B4d = struct.Struct("<B4d")
    return _struct_B4d
