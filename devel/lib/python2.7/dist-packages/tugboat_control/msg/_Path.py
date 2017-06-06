# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tugboat_control/Path.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import tugboat_control.msg

class Path(genpy.Message):
  _md5sum = "f0271dfc1e84d185aae5c12a5ce14e50"
  _type = "tugboat_control/Path"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8 tugID
uint8 orderID
Waypoint[] data
================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation"""
  __slots__ = ['tugID','orderID','data']
  _slot_types = ['uint8','uint8','tugboat_control/Waypoint[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       tugID,orderID,data

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Path, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.tugID is None:
        self.tugID = 0
      if self.orderID is None:
        self.orderID = 0
      if self.data is None:
        self.data = []
    else:
      self.tugID = 0
      self.orderID = 0
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
      _x = self
      buff.write(_get_struct_2B().pack(_x.tugID, _x.orderID))
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
      _x = self
      start = end
      end += 2
      (_x.tugID, _x.orderID,) = _get_struct_2B().unpack(str[start:end])
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
      _x = self
      buff.write(_get_struct_2B().pack(_x.tugID, _x.orderID))
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
      _x = self
      start = end
      end += 2
      (_x.tugID, _x.orderID,) = _get_struct_2B().unpack(str[start:end])
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
_struct_2B = None
def _get_struct_2B():
    global _struct_2B
    if _struct_2B is None:
        _struct_2B = struct.Struct("<2B")
    return _struct_2B