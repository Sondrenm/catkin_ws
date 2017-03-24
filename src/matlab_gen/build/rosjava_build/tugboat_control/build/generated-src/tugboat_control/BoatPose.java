package tugboat_control;

public interface BoatPose extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "tugboat_control/BoatPose";
  static final java.lang.String _DEFINITION = "float64 timestamp\ngeometry_msgs/Pose2D[11] Pose";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  double getTimestamp();
  void setTimestamp(double value);
  java.util.List<geometry_msgs.Pose2D> getPose();
  void setPose(java.util.List<geometry_msgs.Pose2D> value);
}
