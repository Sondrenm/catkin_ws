// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class TugSetpoints {
  constructor() {
    this.ID = 0;
    this.o = 0.0;
    this.force = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type TugSetpoints
    // Serialize message field [ID]
    bufferInfo = _serializer.uint8(obj.ID, bufferInfo);
    // Serialize message field [o]
    bufferInfo = _serializer.float64(obj.o, bufferInfo);
    // Serialize message field [force]
    bufferInfo = _serializer.float64(obj.force, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type TugSetpoints
    let tmp;
    let len;
    let data = new TugSetpoints();
    // Deserialize message field [ID]
    tmp = _deserializer.uint8(buffer);
    data.ID = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [o]
    tmp = _deserializer.float64(buffer);
    data.o = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [force]
    tmp = _deserializer.float64(buffer);
    data.force = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/TugSetpoints';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8794df36994479d46b6355b637b13061';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    float64 o
    float64 force
    `;
  }

};

module.exports = TugSetpoints;
