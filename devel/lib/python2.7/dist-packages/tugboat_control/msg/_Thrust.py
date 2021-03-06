# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tugboat_control/Thrust.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class Thrust(genpy.Message):
  _md5sum = "06f7728b8ee5a6c967559af514f9b25c"
  _type = "tugboat_control/Thrust"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# To Arduino
uint8 ID
int8 thrust # In % +- 100
int8 ccwturn # In % +- 100"""
  __slots__ = ['ID','thrust','ccwturn']
  _slot_types = ['uint8','int8','int8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       ID,thrust,ccwturn

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Thrust, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.ID is None:
        self.ID = 0
      if self.thrust is None:
        self.thrust = 0
      if self.ccwturn is None:
        self.ccwturn = 0
    else:
      self.ID = 0
      self.thrust = 0
      self.ccwturn = 0

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
      buff.write(_get_struct_B2b().pack(_x.ID, _x.thrust, _x.ccwturn))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 3
      (_x.ID, _x.thrust, _x.ccwturn,) = _get_struct_B2b().unpack(str[start:end])
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
      buff.write(_get_struct_B2b().pack(_x.ID, _x.thrust, _x.ccwturn))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 3
      (_x.ID, _x.thrust, _x.ccwturn,) = _get_struct_B2b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B2b = None
def _get_struct_B2b():
    global _struct_B2b
    if _struct_B2b is None:
        _struct_B2b = struct.Struct("<B2b")
    return _struct_B2b
