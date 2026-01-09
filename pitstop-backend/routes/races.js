const express = require('express');
const router = express.Router();
const Race = require('../models/race');


router.get('/', async (req, res) => {
  try {
    const races = await Race.find().sort({ round: 1 });
    res.json(races);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});


router.get('/:year/:round', async (req, res) => {
  try {
    const race = await Race.findOne({ round: parseInt(req.params.round) });
    if (!race) return res.status(404).json({ message: 'Yarış bulunamadı' });
    res.json(race);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

module.exports = router;