const mongoose = require('mongoose');

const resultSchema = new mongoose.Schema({
    position: Number,
  driverId: String,
  teamId: String,
  time: String,             
  points: Number,
  grid: Number,              
  laps: Number,
  status: String,            
  fastestLap: {              
    rank: Number,
    time: String,
    averageSpeed: Number
  }
});

const raceSchema = new mongoose.Schema({
  season: { type: Number, required: true },      
  round: { type: Number, required: true, unique: true }, 
  raceName: { type: String, required: true },
  date: { type: Date, required: true },
  circuitId: { type: String, required: true },   

  winnerDriverId: String, 
  winnerTeamId: String,     

  fastLapTime: String,      
  fastLapDriverId: String,
  fastLapTeamId: String,

  results: [resultSchema],                   

  qualifyingUrl: String,
  sprintUrl: String
}, { timestamps: true });


raceSchema.index({ season: 1, round: 1 }, { unique: true });

module.exports = mongoose.model('Race', raceSchema);