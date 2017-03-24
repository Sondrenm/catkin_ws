package tugboat_control;

public interface Thrust extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "tugboat_control/Thrust";
  static final java.lang.String _DEFINITION = "# To Arduino\nuint8 ID\nint8 thrust # In % + 100\nint8 cwturn # In % + 100";
  static final boolean _IS_SERVICE = false;
  static final boolean _IS_ACTION = false;
  byte getID();
  void setID(byte value);
  byte getThrust();
  void setThrust(byte value);
  byte getCwturn();
  void setCwturn(byte value);
}
