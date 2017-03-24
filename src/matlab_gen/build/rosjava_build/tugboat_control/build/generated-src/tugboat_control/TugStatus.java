package tugboat_control;

public interface TugStatus extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "tugboat_control/TugStatus";
  static final java.lang.String _DEFINITION = "uint8[] ID # ID > 99 indicates ship\nfloat64 x #x position in meters\nfloat64 y #y position in meters\nfloat64 theta #orientation in radians or degrees?\nfloat32 PushingForce # Newton";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  org.jboss.netty.buffer.ChannelBuffer getID();
  void setID(org.jboss.netty.buffer.ChannelBuffer value);
  double getX();
  void setX(double value);
  double getY();
  void setY(double value);
  double getTheta();
  void setTheta(double value);
  float getPushingForce();
  void setPushingForce(float value);
}
