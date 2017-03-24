package tugboat_control;

public interface TugSetpoints extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "tugboat_control/TugSetpoints";
  static final java.lang.String _DEFINITION = "float64 orientation\nfloat64 pushingForce";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  double getOrientation();
  void setOrientation(double value);
  double getPushingForce();
  void setPushingForce(double value);
}
