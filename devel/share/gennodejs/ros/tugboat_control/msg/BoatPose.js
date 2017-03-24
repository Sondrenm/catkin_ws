// Auto-generated. Do not edit!

// (in-package tugboat_control.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class BoatPose {
  constructor() {
    this.timestamp = 0.0;
    this.Pose = new Array(11).fill(new geometry_msgs.msg.Pose2D());
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type BoatPose
    // Serialize message field [timestamp]
    bufferInfo = _serializer.float64(obj.timestamp, bufferInfo);
    // Serialize message field [Pose]
    obj.Pose.forEach((val) => {
      bufferInfo = geometry_msgs.msg.Pose2D.serialize(val, bufferInfo);
    });
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type BoatPose
    let tmp;
    let len;
    let data = new BoatPose();
    // Deserialize message field [timestamp]
    tmp = _deserializer.float64(buffer);
    data.timestamp = tmp.data;
    buffer = tmp.buffer;
    len = 11;
    // Deserialize message field [Pose]
    for (let i = 0; i < len; ++i) {
      tmp = geometry_msgs.msg.Pose2D.deserialize(buffer);
      data.Pose[i] = tmp.data;
      buffer = tmp.buffer;
    }
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'tugboat_control/BoatPose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fac719579a6887c70b1bfc580630888c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 timestamp
    geometry_msgs/Pose2D[11] Pose
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    `;
  }

};

module.exports = BoatPose;
