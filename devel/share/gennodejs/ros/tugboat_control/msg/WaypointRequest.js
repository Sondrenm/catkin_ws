// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class WaypointRequest {
  constructor() {
    this.ID = 0;
    this.x = 0.0;
    this.y = 0.0;
    this.o = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type WaypointRequest
    // Serialize message field [ID]
    bufferInfo = _serializer.uint8(obj.ID, bufferInfo);
    // Serialize message field [x]
    bufferInfo = _serializer.float64(obj.x, bufferInfo);
    // Serialize message field [y]
    bufferInfo = _serializer.float64(obj.y, bufferInfo);
    // Serialize message field [o]
    bufferInfo = _serializer.float64(obj.o, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type WaypointRequest
    let tmp;
    let len;
    let data = new WaypointRequest();
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
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/WaypointRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e95f3e67135784b4229f3c4a980afa6c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    float64 x #x position in meters
    float64 y #y position in meters
    float64 o #orientation in +- pi radians away from "east"
    `;
  }

};

module.exports = WaypointRequest;
