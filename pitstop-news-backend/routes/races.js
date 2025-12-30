const express = require('express');
const router = express.Router();
const axios = require('axios');
const Race = require('../models/race');

// GET /api/races → Tüm yarış kartları
router.get('/', async (req, res) => {
  try {
    const races = await Race.find({ season: 2025 })
      .sort({ round: 1 })
      .select('-results');

    res.json(races);
  } catch (error) {
    console.error('Yarış listesi hatası:', error.message);
    res.status(500).json({ message: 'Yarış listesi alınırken hata oluştu' });
  }
});

// GET /api/races/:round → Tek yarış detayları (tam sıralama)
router.get('/:round', async (req, res) => {
  try {
    const round = parseInt(req.params.round);
    if (isNaN(round) || round < 1 || round > 24) {
      return res.status(400).json({ message: 'Geçersiz round numarası' });
    }

    const season = 2025;

    // Cache kontrol
    let race = await Race.findOne({ season, round });
    if (race && race.results && race.results.length > 0) {
      return res.json(race);
    }

    // External API'den çek
    const response = await axios.get(`https://f1api.dev/api/${season}/${round}/race`);
    const raceData = response.data;

    const raceInfo = raceData.races || raceData; // Tek yarış objesi

    const results = (raceInfo.results || []).map(r => ({
      position: r.position && !isNaN(parseInt(r.position)) ? parseInt(r.position) : null, // NaN önleme
      driverId: r.driver?.driverId || r.driverId,
      teamId: r.team?.teamId || r.teamId,
      time: r.time || r.status || 'DNF',
      points: r.points && !isNaN(parseFloat(r.points)) ? parseFloat(r.points) : 0,
      grid: r.grid && !isNaN(parseInt(r.grid)) ? parseInt(r.grid) : null,
      laps: r.laps && !isNaN(parseInt(r.laps)) ? parseInt(r.laps) : null,
      status: r.status || 'Finished',
      fastestLap: r.fastestLap ? {
        rank: r.fastestLap.rank && !isNaN(parseInt(r.fastestLap.rank)) ? parseInt(r.fastestLap.rank) : null,
        time: r.fastestLap.time,
        averageSpeed: r.fastestLap.averageSpeed && !isNaN(parseFloat(r.fastestLap.averageSpeed)) ? parseFloat(r.fastestLap.averageSpeed) : null
      } : null
    }));

    const fullRace = {
      season,
      round,
      raceName: raceInfo.raceName,
      date: raceInfo.date || null,
      circuitId: raceInfo.circuit?.circuitId || raceInfo.circuitId,
      results
    };

    // Cache'e kaydet
    race = await Race.findOneAndUpdate(
      { season, round },
      fullRace,
      { upsert: true, new: true }
    );

    console.log(`Round ${round} kaydedildi (${results.length} sonuç)`);
    res.json(race);
  } catch (error) {
    if (error.response?.status === 404) {
      return res.status(404).json({ message: 'Bu round için sonuç bulunamadı' });
    }
    console.error(`Round ${req.params.round} hatası:`, error.message);
    res.status(500).json({ message: 'Yarış detayları alınırken hata oluştu' });
  }
});

module.exports = router;