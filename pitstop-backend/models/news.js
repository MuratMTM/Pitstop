const mongoose = require('mongoose');
const { create } = require('./team');

const newsSchema = new mongoose.Schema({
    title: {type: String, required: true},
    summary: {type: String},
    content: {type: String},
    url: {type: String, required: true},
    imageUrl: {type: String, default: 'Motorsport.com'},
    publishedAt: {type: Date},
    createdAt: {type: Date, default: Date.now}
}, {timestamps: true});

module.exports = mongoose.model('News', newsSchema);