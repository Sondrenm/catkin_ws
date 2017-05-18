// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BoatStatus = require('./BoatStatus.js');

//-----------------------------------------------------------

class BoatList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.boat = null;
    }
    else {
      if (initObj.hasOwnProperty('boat')) {
        this.boat = initObj.boat
      }
      else {
        this.boat = new Array(50).fill(new BoatStatus());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BoatList
    // Check that the constant length array field [boat] has the right length
    if (obj.boat.length !== 50) {
      throw new Error('Unable to serialize array field boat - length must be 50')
    }
    // Serialize message field [boat]
    obj.boat.forEach((val) => {
      bufferOffset = BoatStatus.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BoatList
    let len;
    let data = new BoatList(null);
    // Deserialize message field [boat]
    len = 50;
    data.boat = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.boat[i] = BoatStatus.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    return 29;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/BoatList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fb1531b66e8422b2c672c2aeeec4a39f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    tugboat_control/BoatStatus[50] boat
    ================================================================================
    MSG: tugboat_control/BoatStatus
    uint8 ID # ID == 0 indicates ship
    float64 x #x position in meters
    float64 y #y position in meters
    float64 o #orientation in +-pi radians from "east"
    float32 force # Newton
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BoatList(null);
    if (msg.boat !== undefined) {
      resolved.boat = new Array(50)
      for (let i = 0; i < resolved.boat.length; ++i) {
        if (msg.boat.length > i) {
          resolved.boat[i] = BoatStatus.Resolve(msg.boat[i]);
        }
        else {
          resolved.boat[i] = new BoatStatus();
        }
      }
    }
    else {
      resolved.boat = new Array(50).fill(new BoatStatus())
    }

    return resolved;
    }
};

module.exports = BoatList;
