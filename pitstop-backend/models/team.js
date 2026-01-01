const mongoose = require('mongoose');

const teamSchema = new mongoose.Schema({
  teamId: { type: String, required: true, unique: true }, 
  teamName: { type: String, required: true },            
  teamNationality: { type: String },                    
  firstAppeareance: { type: Number },                    
  constructorsChampionships: { type: Number, default: 0 },
  driversChampionships: { type: Number, default: 0 },
  url: { type: String },                               

  points: { type: Number, default: 0 },
  position: { type: Number, default: 999 },
  wins: { type: Number, default: 0 },

  teamColor: { type: String },                          
  flagUrl: { type: String },                           
  carImageUrl: { type: String }, 
  teamLogoUrl: { type: String }                         
}, { timestamps: true });

module.exports = mongoose.model('Team', teamSchema);