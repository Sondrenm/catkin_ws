// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class Waypoint {
  constructor() {
    this.ID = 0;
    this.x = 0.0;
    this.y = 0.0;
    this.v = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Waypoint
    // Serialize message field [ID]
    bufferInfo = _serializer.uint8(obj.ID, bufferInfo);
    // Serialize message field [x]
    bufferInfo = _serializer.float64(obj.x, bufferInfo);
    // Serialize message field [y]
    bufferInfo = _serializer.float64(obj.y, bufferInfo);
    // Serialize message field [v]
    bufferInfo = _serializer.float64(obj.v, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Waypoint
    let tmp;
    let len;
    let data = new Waypoint();
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
    // Deserialize message field [v]
    tmp = _deserializer.float64(buffer);
    data.v = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/Waypoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '599dfbedb76ef56ba69b3e5141431273';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    float64 x #x position in meters
    float64 y #y position in meters
    float64 v #Velocity in m/s
    `;
  }

};

module.exports = Waypoint;
