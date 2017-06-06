// Auto-generated. Do not edit!

// (in-package tugboat_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Waypoint = require('../msg/Waypoint.js');

//-----------------------------------------------------------

let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class WaypointAvailableRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.waypoint = null;
    }
    else {
      if (initObj.hasOwnProperty('waypoint')) {
        this.waypoint = initObj.waypoint
      }
      else {
        this.waypoint = new Waypoint();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WaypointAvailableRequest
    // Serialize message field [waypoint]
    bufferOffset = Waypoint.serialize(obj.waypoint, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WaypointAvailableRequest
    let len;
    let data = new WaypointAvailableRequest(null);
    // Deserialize message field [waypoint]
    data.waypoint = Waypoint.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 33;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tugboat_control/WaypointAvailableRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9a1d86b9c7914a76bee33a409fcfe4da';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Waypoint waypoint
    
    ================================================================================
    MSG: tugboat_control/Waypoint
    uint8 ID
    float64 x #	x position in meters
    float64 y #	y position in meters
    float64 v #	Velocity in m/s
    float64 o #	Orientation in +- pi radians from x-axis, for ship. Set outside scope to ignore Orientation
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WaypointAvailableRequest(null);
    if (msg.waypoint !== undefined) {
      resolved.waypoint = Waypoint.Resolve(msg.waypoint)
    }
    else {
      resolved.waypoint = new Waypoint()
    }

    return resolved;
    }
};

class WaypointAvailableResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ans = null;
    }
    else {
      if (initObj.hasOwnProperty('ans')) {
        this.ans = initObj.ans
      }
      else {
        this.ans = new std_msgs.msg.Bool();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WaypointAvailableResponse
    // Serialize message field [ans]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.ans, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WaypointAvailableResponse
    let len;
    let data = new WaypointAvailableResponse(null);
    // Deserialize message field [ans]
    data.ans = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tugboat_control/WaypointAvailableResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b2020b919eb112b1b4fe9db01673724e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Bool ans
    
    ================================================================================
    MSG: std_msgs/Bool
    bool data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WaypointAvailableResponse(null);
    if (msg.ans !== undefined) {
      resolved.ans = std_msgs.msg.Bool.Resolve(msg.ans)
    }
    else {
      resolved.ans = new std_msgs.msg.Bool()
    }

    return resolved;
    }
};

module.exports = {
  Request: WaypointAvailableRequest,
  Response: WaypointAvailableResponse,
  md5sum() { return 'e256e0c870845448cbf5d0a1d2ba0749'; },
  datatype() { return 'tugboat_control/WaypointAvailable'; }
};
