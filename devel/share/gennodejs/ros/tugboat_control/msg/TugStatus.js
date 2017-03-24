// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class TugStatus {
  constructor() {
    this.ID = [];
    this.x = 0.0;
    this.y = 0.0;
    this.theta = 0.0;
    this.PushingForce = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type TugStatus
    // Serialize the length for message field [ID]
    bufferInfo = _serializer.uint32(obj.ID.length, bufferInfo);
    // Serialize message field [ID]
    bufferInfo.buffer.push(obj.ID);
    bufferInfo.length += obj.ID.length;
    // Serialize message field [x]
    bufferInfo = _serializer.float64(obj.x, bufferInfo);
    // Serialize message field [y]
    bufferInfo = _serializer.float64(obj.y, bufferInfo);
    // Serialize message field [theta]
    bufferInfo = _serializer.float64(obj.theta, bufferInfo);
    // Serialize message field [PushingForce]
    bufferInfo = _serializer.float32(obj.PushingForce, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type TugStatus
    let tmp;
    let len;
    let data = new TugStatus();
    // Deserialize array length for message field [ID]
    tmp = _deserializer.uint32(buffer);
    len = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [ID]
    data.ID = buffer.slice(0, len);
    buffer =  buffer.slice(len);
    // Deserialize message field [x]
    tmp = _deserializer.float64(buffer);
    data.x = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [y]
    tmp = _deserializer.float64(buffer);
    data.y = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [theta]
    tmp = _deserializer.float64(buffer);
    data.theta = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [PushingForce]
    tmp = _deserializer.float32(buffer);
    data.PushingForce = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/TugStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5cbdaa7ad30be6bec977e5b38206d8e9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8[] ID # ID > 99 indicates ship
    float64 x #x position in meters
    float64 y #y position in meters
    float64 theta #orientation in radians or degrees?
    float32 PushingForce # Newton
    `;
  }

};

module.exports = TugStatus;
