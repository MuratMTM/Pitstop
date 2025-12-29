const mongoose = require('mongoose');

const circuitSchema = new mongoose.Schema({
circuitId: { type: String, required: true, unique: true }, 
  circuitName: { type: String, required: true },            
  location: { type: String },                               
  country: { type: String },
  lat: { type: Number },
  lng: { type: Number },
  url: { type: String },                                    
  layoutImageUrl: { type: String }                       
}, { timestamps: true });

module.exports =  mongoose.model('Circuit', circuitSchema);