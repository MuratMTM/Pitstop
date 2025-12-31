const mongoose = require('mongoose');

const driverSchema = new mongoose.Schema({
  driverId: { type: String, required: true, unique: true },
  givenName: { type: String, required: true },
  familyName: { type: String, required: true },
  fullName: { type: String },
  nationality: { type: String },
  birthday: { type: String },       
  number: { type: Number },
  shortName: { type: String },
  url: { type: String },             

  teamName: { type: String },       
  
  points: { type: Number, default: 0 },
  position: { type: Number, default: 999 },

  imageUrl: { type: String },
  teamColor: { type: String }  ,
  flagUrl: {type: String }      
}, { timestamps: true });

module.exports = mongoose.model('Driver', driverSchema); 