// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class ShipWaypoint {
  constructor() {
    this.xPos = 0.0;
    this.yPos = 0.0;
    this.orientation = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type ShipWaypoint
    // Serialize message field [xPos]
    bufferInfo = _serializer.float64(obj.xPos, bufferInfo);
    // Serialize message field [yPos]
    bufferInfo = _serializer.float64(obj.yPos, bufferInfo);
    // Serialize message field [orientation]
    bufferInfo = _serializer.float64(obj.orientation, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type ShipWaypoint
    let tmp;
    let len;
    let data = new ShipWaypoint();
    // Deserialize message field [xPos]
    tmp = _deserializer.float64(buffer);
    data.xPos = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [yPos]
    tmp = _deserializer.float64(buffer);
    data.yPos = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [orientation]
    tmp = _deserializer.float64(buffer);
    data.orientation = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/ShipWaypoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '12dcab14506cdf2d1ef5fd11bde47896';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 xPos
    float64 yPos
    float64 orientation 
    #What more do you want?
    `;
  }

};

module.exports = ShipWaypoint;
