package tugboat_control;

public interface PushingForce extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "tugboat_control/PushingForce";
  static final java.lang.String _DEFINITION = "# From Arduino\nuint8 ID\nfloat32 Newton";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getID();
  void setID(byte value);
  float getNewton();
  void setNewton(float value);
}
