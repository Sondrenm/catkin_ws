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
    this.orientation = 0.0;
    this.pushingForce = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type TugSetpoints
    // Serialize message field [ID]
    bufferInfo = _serializer.uint8(obj.ID, bufferInfo);
    // Serialize message field [orientation]
    bufferInfo = _serializer.float64(obj.orientation, bufferInfo);
    // Serialize message field [pushingForce]
    bufferInfo = _serializer.float64(obj.pushingForce, bufferInfo);
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
    // Deserialize message field [orientation]
    tmp = _deserializer.float64(buffer);
    data.orientation = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [pushingForce]
    tmp = _deserializer.float64(buffer);
    data.pushingForce = tmp.data;
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
    return '0b1a644af72e0374fc50096b433f3946';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    float64 orientation
    float64 pushingForce
    `;
  }

};

module.exports = TugSetpoints;
