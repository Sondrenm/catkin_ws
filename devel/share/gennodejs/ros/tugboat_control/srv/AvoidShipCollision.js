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


//-----------------------------------------------------------

class AvoidShipCollisionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.from = null;
      this.to = null;
    }
    else {
      if (initObj.hasOwnProperty('from')) {
        this.from = initObj.from
      }
      else {
        this.from = new Waypoint();
      }
      if (initObj.hasOwnProperty('to')) {
        this.to = initObj.to
      }
      else {
        this.to = new Waypoint();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AvoidShipCollisionRequest
    // Serialize message field [from]
    bufferOffset = Waypoint.serialize(obj.from, buffer, bufferOffset);
    // Serialize message field [to]
    bufferOffset = Waypoint.serialize(obj.to, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AvoidShipCollisionRequest
    let len;
    let data = new AvoidShipCollisionRequest(null);
    // Deserialize message field [from]
    data.from = Waypoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [to]
    data.to = Waypoint.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 66;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tugboat_control/AvoidShipCollisionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7fb7db3213c959c641065ea924ef61a5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Waypoint from
    Waypoint to
    
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
    const resolved = new AvoidShipCollisionRequest(null);
    if (msg.from !== undefined) {
      resolved.from = Waypoint.Resolve(msg.from)
    }
    else {
      resolved.from = new Waypoint()
    }

    if (msg.to !== undefined) {
      resolved.to = Waypoint.Resolve(msg.to)
    }
    else {
      resolved.to = new Waypoint()
    }

    return resolved;
    }
};

class AvoidShipCollisionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AvoidShipCollisionResponse
    // Serialize message field [path]
    // Serialize the length for message field [path]
    bufferOffset = _serializer.uint32(obj.path.length, buffer, bufferOffset);
    obj.path.forEach((val) => {
      bufferOffset = Waypoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AvoidShipCollisionResponse
    let len;
    let data = new AvoidShipCollisionResponse(null);
    // Deserialize message field [path]
    // Deserialize array length for message field [path]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.path = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.path[i] = Waypoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 33 * object.path.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tugboat_control/AvoidShipCollisionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '05c4b7b31d8093582857272e1de3c70c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Waypoint[] path
    
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
    const resolved = new AvoidShipCollisionResponse(null);
    if (msg.path !== undefined) {
      resolved.path = new Array(msg.path.length);
      for (let i = 0; i < resolved.path.length; ++i) {
        resolved.path[i] = Waypoint.Resolve(msg.path[i]);
      }
    }
    else {
      resolved.path = []
    }

    return resolved;
    }
};

module.exports = {
  Request: AvoidShipCollisionRequest,
  Response: AvoidShipCollisionResponse,
  md5sum() { return '1d3ed13e2b52083674842ac5b19130cb'; },
  datatype() { return 'tugboat_control/AvoidShipCollision'; }
};
