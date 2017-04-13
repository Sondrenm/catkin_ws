// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class PushingForce {
  constructor() {
    this.ID = 0;
    this.force = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type PushingForce
    // Serialize message field [ID]
    bufferInfo = _serializer.uint8(obj.ID, bufferInfo);
    // Serialize message field [force]
    bufferInfo = _serializer.float32(obj.force, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type PushingForce
    let tmp;
    let len;
    let data = new PushingForce();
    // Deserialize message field [ID]
    tmp = _deserializer.uint8(buffer);
    data.ID = tmp.data;
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
    return 'tugboat_control/PushingForce';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7005a38011551613bbcdafc2f85d46e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # From Arduino
    uint8 ID
    float32 force #in Newton
    `;
  }

};

module.exports = PushingForce;
