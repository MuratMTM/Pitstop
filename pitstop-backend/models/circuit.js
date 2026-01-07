const mongoose = require('mongoose');

const circuitSchema = new mongoose.Schema({
  circuitId: { type: String, required: true, unique: true },
  circuitName: { type: String, required: true },
  country: { type: String, required: true },
  city: { type: String },                  
  circuitLength: { type: Number },     
  lapRecord: { type: String },        
  firstParticipationYear: { type: Number }, 
  numberOfCorners: { type: Number },       
  fastestLapDriverId: { type: String },
  fastestLapTeamId: { type: String },
  fastestLapYear: { type: Number },
  url: { type: String },
  circuitImageUrl: { type: String }        
}, { timestamps: true });

module.exports = mongoose.model('Circuit', circuitSchema);