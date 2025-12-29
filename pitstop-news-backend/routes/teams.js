const express = require('express');
const router = express.Router();
const Team = require('../models/team');


router.get('/', async (req, res) => {
  try {
    const teams = await Team.find().sort({ position: 1 }); 
    res.json(teams);
  } catch (error) {
    res.status(500).json({ message: 'Takım verileri alınırken hata oluştu', error: error.message });
  }
});

module.exports = router;