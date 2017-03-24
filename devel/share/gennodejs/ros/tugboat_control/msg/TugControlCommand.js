// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class TugControlCommand {
  constructor() {
    this.orientation = 0.0;
    this.pushingForce = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type TugControlCommand
    // Serialize message field [orientation]
    bufferInfo = _serializer.float32(obj.orientation, bufferInfo);
    // Serialize message field [pushingForce]
    bufferInfo = _serializer.float32(obj.pushingForce, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type TugControlCommand
    let tmp;
    let len;
    let data = new TugControlCommand();
    // Deserialize message field [orientation]
    tmp = _deserializer.float32(buffer);
    data.orientation = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [pushingForce]
    tmp = _deserializer.float32(buffer);
    data.pushingForce = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/TugControlCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '38391dab0ab53d38a3bbd7116ff3b3f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 orientation
    float32 pushingForce
    `;
  }

};

module.exports = TugControlCommand;
