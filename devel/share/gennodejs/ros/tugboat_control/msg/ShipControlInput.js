// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let BoatPose = require('./BoatPose.js');
let TugStatus = require('./TugStatus.js');

//-----------------------------------------------------------

class ShipControlInput {
  constructor() {
    this.ShipPose = new BoatPose();
    this.TugStatus = [];
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type ShipControlInput
    // Serialize message field [ShipPose]
    bufferInfo = BoatPose.serialize(obj.ShipPose, bufferInfo);
    // Serialize the length for message field [TugStatus]
    bufferInfo = _serializer.uint32(obj.TugStatus.length, bufferInfo);
    // Serialize message field [TugStatus]
    obj.TugStatus.forEach((val) => {
      bufferInfo = TugStatus.serialize(val, bufferInfo);
    });
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type ShipControlInput
    let tmp;
    let len;
    let data = new ShipControlInput();
    // Deserialize message field [ShipPose]
    tmp = BoatPose.deserialize(buffer);
    data.ShipPose = tmp.data;
    buffer = tmp.buffer;
    // Deserialize array length for message field [TugStatus]
    tmp = _deserializer.uint32(buffer);
    len = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [TugStatus]
    data.TugStatus = new Array(len);
    for (let i = 0; i < len; ++i) {
      tmp = TugStatus.deserialize(buffer);
      data.TugStatus[i] = tmp.data;
      buffer = tmp.buffer;
    }
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/ShipControlInput';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '945e5ec50a8c1a88de62ff9741f9d15f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #What information is pertinent for controller??
    tugboat_control/BoatPose ShipPose
    tugboat_control/TugStatus[] TugStatus
    ================================================================================
    MSG: tugboat_control/BoatPose
    float64 timestamp
    geometry_msgs/Pose2D[11] Pose
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    ================================================================================
    MSG: tugboat_control/TugStatus
    uint8[] ID # ID > 99 indicates ship
    float64 x #x position in meters
    float64 y #y position in meters
    float64 theta #orientation in radians or degrees?
    float32 PushingForce # Newton
    `;
  }

};

module.exports = ShipControlInput;
