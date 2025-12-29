const express = require('express');
const router = express.Router();
const Circuit = require('../models/circuit');

router.get('/', async (req, res) => {
  try {
    const circuits = await Circuit.find().sort({ circuitName: 1 });
    res.json(circuits);
  } catch (error) {
    res.status(500).json({ message: 'Pist verileri alınırken hata oluştu' });
  }
});

module.exports = router;