// Auto-generated. Do not edit!

// (in-package tugboat_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let BoatPose = require('../msg/BoatPose.js');

//-----------------------------------------------------------

class addOneTugRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type addOneTugRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type addOneTugRequest
    let len;
    let data = new addOneTugRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tugboat_control/addOneTugRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new addOneTugRequest(null);
    return resolved;
    }
};

class addOneTugResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Pose = null;
    }
    else {
      if (initObj.hasOwnProperty('Pose')) {
        this.Pose = initObj.Pose
      }
      else {
        this.Pose = new BoatPose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type addOneTugResponse
    // Serialize message field [Pose]
    bufferOffset = BoatPose.serialize(obj.Pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type addOneTugResponse
    let len;
    let data = new addOneTugResponse(null);
    // Deserialize message field [Pose]
    data.Pose = BoatPose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a service object
    return 'tugboat_control/addOneTugResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '605a7c6929aec48e81da00e68778ab7c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    BoatPose Pose
    
    ================================================================================
    MSG: tugboat_control/BoatPose
    uint8 ID # ID
    float64 x #x position in meters
    float64 y #y position in meters
    float64 o #orientation in +-pi radians from x-axis
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new addOneTugResponse(null);
    if (msg.Pose !== undefined) {
      resolved.Pose = BoatPose.Resolve(msg.Pose)
    }
    else {
      resolved.Pose = new BoatPose()
    }

    return resolved;
    }
};

module.exports = {
  Request: addOneTugRequest,
  Response: addOneTugResponse,
  md5sum() { return '605a7c6929aec48e81da00e68778ab7c'; },
  datatype() { return 'tugboat_control/addOneTug'; }
};
