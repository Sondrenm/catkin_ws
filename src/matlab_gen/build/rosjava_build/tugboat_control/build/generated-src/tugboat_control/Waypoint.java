package tugboat_control;

public interface Waypoint extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "tugboat_control/Waypoint";
  static final java.lang.String _DEFINITION = "uint8 ID\nfloat64 x #x position in meters\nfloat64 y #y position in meters\nfloat64 theta #orientation in radians or degrees?\nfloat64 v #Velocity in m/s";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getID();
  void setID(byte value);
  double getX();
  void setX(double value);
  double getY();
  void setY(double value);
  double getTheta();
  void setTheta(double value);
  double getV();
  void setV(double value);
}
