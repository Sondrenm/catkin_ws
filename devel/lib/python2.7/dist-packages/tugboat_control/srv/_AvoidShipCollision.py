# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tugboat_control/AvoidShipCollisionRequest.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import tugboat_control.msg

class AvoidShipCollisionRequest(genpy.Message):
  _md5sum = "7fb7db3213c959c641065ea924ef61a5"
  _type = "tugboat_control/AvoidShipCollisionRequest"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """Waypoint from
Waypoint to

================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation"""
  __slots__ = ['from_','to']
  _slot_types = ['tugboat_control/Waypoint','tugboat_control/Waypoint']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       from_,to

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AvoidShipCollisionRequest, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.from_ is None:
        self.from_ = tugboat_control.msg.Waypoint()
      if self.to is None:
        self.to = tugboat_control.msg.Waypoint()
    else:
      self.from_ = tugboat_control.msg.Waypoint()
      self.to = tugboat_control.msg.Waypoint()

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
      buff.write(_get_struct_B4dB4d().pack(_x.from_.ID, _x.from_.x, _x.from_.y, _x.from_.v, _x.from_.o, _x.to.ID, _x.to.x, _x.to.y, _x.to.v, _x.to.o))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.from_ is None:
        self.from_ = tugboat_control.msg.Waypoint()
      if self.to is None:
        self.to = tugboat_control.msg.Waypoint()
      end = 0
      _x = self
      start = end
      end += 66
      (_x.from_.ID, _x.from_.x, _x.from_.y, _x.from_.v, _x.from_.o, _x.to.ID, _x.to.x, _x.to.y, _x.to.v, _x.to.o,) = _get_struct_B4dB4d().unpack(str[start:end])
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
      buff.write(_get_struct_B4dB4d().pack(_x.from_.ID, _x.from_.x, _x.from_.y, _x.from_.v, _x.from_.o, _x.to.ID, _x.to.x, _x.to.y, _x.to.v, _x.to.o))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.from_ is None:
        self.from_ = tugboat_control.msg.Waypoint()
      if self.to is None:
        self.to = tugboat_control.msg.Waypoint()
      end = 0
      _x = self
      start = end
      end += 66
      (_x.from_.ID, _x.from_.x, _x.from_.y, _x.from_.v, _x.from_.o, _x.to.ID, _x.to.x, _x.to.y, _x.to.v, _x.to.o,) = _get_struct_B4dB4d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B4dB4d = None
def _get_struct_B4dB4d():
    global _struct_B4dB4d
    if _struct_B4dB4d is None:
        _struct_B4dB4d = struct.Struct("<B4dB4d")
    return _struct_B4dB4d
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tugboat_control/AvoidShipCollisionResponse.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import tugboat_control.msg

class AvoidShipCollisionResponse(genpy.Message):
  _md5sum = "05c4b7b31d8093582857272e1de3c70c"
  _type = "tugboat_control/AvoidShipCollisionResponse"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """Waypoint[] path

================================================================================
MSG: tugboat_control/Waypoint
uint8 ID
float64 x #	x position in meters
float64 y #	y position in meters
float64 v #	Velocity in m/s
float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation"""
  __slots__ = ['path']
  _slot_types = ['tugboat_control/Waypoint[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       path

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AvoidShipCollisionResponse, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.path is None:
        self.path = []
    else:
      self.path = []

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
      length = len(self.path)
      buff.write(_struct_I.pack(length))
      for val1 in self.path:
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
      if self.path is None:
        self.path = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.path = []
      for i in range(0, length):
        val1 = tugboat_control.msg.Waypoint()
        _x = val1
        start = end
        end += 33
        (_x.ID, _x.x, _x.y, _x.v, _x.o,) = _get_struct_B4d().unpack(str[start:end])
        self.path.append(val1)
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
      length = len(self.path)
      buff.write(_struct_I.pack(length))
      for val1 in self.path:
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
      if self.path is None:
        self.path = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.path = []
      for i in range(0, length):
        val1 = tugboat_control.msg.Waypoint()
        _x = val1
        start = end
        end += 33
        (_x.ID, _x.x, _x.y, _x.v, _x.o,) = _get_struct_B4d().unpack(str[start:end])
        self.path.append(val1)
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
class AvoidShipCollision(object):
  _type          = 'tugboat_control/AvoidShipCollision'
  _md5sum = '1d3ed13e2b52083674842ac5b19130cb'
  _request_class  = AvoidShipCollisionRequest
  _response_class = AvoidShipCollisionResponse