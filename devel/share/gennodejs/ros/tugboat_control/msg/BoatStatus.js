// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class BoatStatus {
  constructor() {
    this.ID = 0;
    this.x = 0.0;
    this.y = 0.0;
    this.o = 0.0;
    this.force = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type BoatStatus
    // Serialize message field [ID]
    bufferInfo = _serializer.uint8(obj.ID, bufferInfo);
    // Serialize message field [x]
    bufferInfo = _serializer.float64(obj.x, bufferInfo);
    // Serialize message field [y]
    bufferInfo = _serializer.float64(obj.y, bufferInfo);
    // Serialize message field [o]
    bufferInfo = _serializer.float64(obj.o, bufferInfo);
    // Serialize message field [force]
    bufferInfo = _serializer.float32(obj.force, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type BoatStatus
    let tmp;
    let len;
    let data = new BoatStatus();
    // Deserialize message field [ID]
    tmp = _deserializer.uint8(buffer);
    data.ID = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [x]
    tmp = _deserializer.float64(buffer);
    data.x = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [y]
    tmp = _deserializer.float64(buffer);
    data.y = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [o]
    tmp = _deserializer.float64(buffer);
    data.o = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [force]
    tmp = _deserializer.float32(buffer);
    data.force = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/BoatStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2567430f0fee0ed87837dda5f3903f11';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID # ID == 0 indicates ship
    float64 x #x position in meters
    float64 y #y position in meters
    float64 o #orientation in +-pi radians from "east"
    float32 force # Newton
    `;
  }

};

module.exports = BoatStatus;
