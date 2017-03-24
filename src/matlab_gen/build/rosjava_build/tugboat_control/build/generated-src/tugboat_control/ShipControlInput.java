package tugboat_control;

public interface ShipControlInput extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "tugboat_control/ShipControlInput";
  static final java.lang.String _DEFINITION = "#What information is pertinent for controller??\ntugboat_control/BoatPose ShipPose\ntugboat_control/TugStatus[100] TugStatus";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  tugboat_control.BoatPose getShipPose();
  void setShipPose(tugboat_control.BoatPose value);
  java.util.List<tugboat_control.TugStatus> getTugStatus();
  void setTugStatus(java.util.List<tugboat_control.TugStatus> value);
}
