const express = require('express')
const router = express.Router();
const Driver = require('../models/driver');

router.get('/', async(req, res) => {
    try {
        const drivers = await Driver.find();
        res.json(drivers);
    } catch (error) {
        res.status(500).json({messasge: 'Veri alınırken hata oluştu.'});
    }
});

module.exports = router;
