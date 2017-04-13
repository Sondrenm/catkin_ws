// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let BoatStatus = require('./BoatStatus.js');

//-----------------------------------------------------------

class BoatList {
  constructor() {
    this.timestamp = 0.0;
    this.boat = [];
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type BoatList
    // Serialize message field [timestamp]
    bufferInfo = _serializer.float64(obj.timestamp, bufferInfo);
    // Serialize the length for message field [boat]
    bufferInfo = _serializer.uint32(obj.boat.length, bufferInfo);
    // Serialize message field [boat]
    obj.boat.forEach((val) => {
      bufferInfo = BoatStatus.serialize(val, bufferInfo);
    });
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type BoatList
    let tmp;
    let len;
    let data = new BoatList();
    // Deserialize message field [timestamp]
    tmp = _deserializer.float64(buffer);
    data.timestamp = tmp.data;
    buffer = tmp.buffer;
    // Deserialize array length for message field [boat]
    tmp = _deserializer.uint32(buffer);
    len = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [boat]
    data.boat = new Array(len);
    for (let i = 0; i < len; ++i) {
      tmp = BoatStatus.deserialize(buffer);
      data.boat[i] = tmp.data;
      buffer = tmp.buffer;
    }
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/BoatList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1df20aa31d5e143e5b643777392ea400';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 timestamp
    tugboat_control/BoatStatus[] boat
    ================================================================================
    MSG: tugboat_control/BoatStatus
    uint8 ID # ID == 0 indicates ship
    float64 x #x position in meters
    float64 y #y position in meters
    float64 o #orientation in +-pi radians from "east"
    float32 force # Newton
    `;
  }

};

module.exports = BoatList;
