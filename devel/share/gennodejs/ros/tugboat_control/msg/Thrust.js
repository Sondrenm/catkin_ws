// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class Thrust {
  constructor() {
    this.ID = 0;
    this.thrust = 0;
    this.cwturn = 0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Thrust
    // Serialize message field [ID]
    bufferInfo = _serializer.uint8(obj.ID, bufferInfo);
    // Serialize message field [thrust]
    bufferInfo = _serializer.int8(obj.thrust, bufferInfo);
    // Serialize message field [cwturn]
    bufferInfo = _serializer.int8(obj.cwturn, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Thrust
    let tmp;
    let len;
    let data = new Thrust();
    // Deserialize message field [ID]
    tmp = _deserializer.uint8(buffer);
    data.ID = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [thrust]
    tmp = _deserializer.int8(buffer);
    data.thrust = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [cwturn]
    tmp = _deserializer.int8(buffer);
    data.cwturn = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/Thrust';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb36a969d5d22c5ec8c64a8469c7e207';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # To Arduino
    uint8 ID
    int8 thrust # In % + 100
    int8 cwturn # In % + 100
    `;
  }

};

module.exports = Thrust;
