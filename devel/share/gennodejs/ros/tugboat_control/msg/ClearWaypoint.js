// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ClearWaypoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.orderID = null;
      this.tugID = null;
    }
    else {
      if (initObj.hasOwnProperty('orderID')) {
        this.orderID = initObj.orderID
      }
      else {
        this.orderID = 0;
      }
      if (initObj.hasOwnProperty('tugID')) {
        this.tugID = initObj.tugID
      }
      else {
        this.tugID = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ClearWaypoint
    // Serialize message field [orderID]
    bufferOffset = _serializer.uint8(obj.orderID, buffer, bufferOffset);
    // Serialize message field [tugID]
    bufferOffset = _serializer.uint8(obj.tugID, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ClearWaypoint
    let len;
    let data = new ClearWaypoint(null);
    // Deserialize message field [orderID]
    data.orderID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [tugID]
    data.tugID = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/ClearWaypoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8bfe7bbf9baec34c11567f7f4f04bf49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 orderID
    uint8 tugID
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ClearWaypoint(null);
    if (msg.orderID !== undefined) {
      resolved.orderID = msg.orderID;
    }
    else {
      resolved.orderID = 0
    }

    if (msg.tugID !== undefined) {
      resolved.tugID = msg.tugID;
    }
    else {
      resolved.tugID = 0
    }

    return resolved;
    }
};

module.exports = ClearWaypoint;
