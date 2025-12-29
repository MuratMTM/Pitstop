const mongoose = require('mongoose');

const driverSchema = new mongoose.Schema({
 driverId: { type: String, required: true, unique: true }, 
  givenName: { type: String, required: true },
  familyName: { type: String, required: true },
  fullName: { type: String }, 
  nationality: String,
  team: String,
  points: { type: Number, default: 0 },
  position: { type: Number },
  imageUrl: { type: String }, 
  teamColor: { type: String } 
}, { timestamps: true }   
);

module.exports = mongoose.model('driver', driverSchema);
