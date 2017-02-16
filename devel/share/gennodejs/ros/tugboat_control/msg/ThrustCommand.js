// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class ThrustCommand {
  constructor() {
    this.ID = 0;
    this.thrust = 0;
    this.cwturn = 0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type ThrustCommand
    // Serialize message field [ID]
    bufferInfo = _serializer.int8(obj.ID, bufferInfo);
    // Serialize message field [thrust]
    bufferInfo = _serializer.int8(obj.thrust, bufferInfo);
    // Serialize message field [cwturn]
    bufferInfo = _serializer.int8(obj.cwturn, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type ThrustCommand
    let tmp;
    let len;
    let data = new ThrustCommand();
    // Deserialize message field [ID]
    tmp = _deserializer.int8(buffer);
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
    return 'tugboat_control/ThrustCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fcc2a347632ee0312c19efd7a2a067b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 ID
    int8 thrust
    int8 cwturn
    `;
  }

};

module.exports = ThrustCommand;
