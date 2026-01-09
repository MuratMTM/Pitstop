const axios = require('axios');
const Race = require('../models/race');

async function updateRaces() {
  try {
   // await Race.deleteMany({});
    //console.log('Tüm eski races verileri silindi – yeni takvim kaydediliyor...');

    console.log('Yarış takvimi verileri çekiliyor... (f1api.dev)');
    const response = await axios.get('https://f1api.dev/api/current');
    const races = response.data.races;

    for (let race of races) {
      const year = 2025; 
      const round = race.round;
      

      let results = [];
      try {
        const detailResponse = await axios.get(`https://f1api.dev/api/${year}/${round}/race`);
        results = detailResponse.data.races.results || [];
      } catch (detailError) {
        console.error(`Yarış detayı hatası (round ${round}):`, detailError.message);
      }

      await Race.findOneAndUpdate(
        { raceId: race.raceId },
        {
          raceId: race.raceId,
          championshipId: race.championshipId,
          raceName: race.raceName,
          round: race.round,
          laps: race.laps,
          url: race.url,
          schedule: race.schedule,
          fastLap: race.fastLap,
          circuit: race.circuit,
          winner: race.winner,
          teamWinner: race.teamWinner,
          results: results  
        },
        { upsert: true }
      );
    }

    console.log(`✅ ${races.length} yarış başarıyla güncellendi (detay sıralamaları dahil)`);
  } catch (error) {
    console.error('❌ Race updater hatası:', error.message);
  }
}

module.exports = { updateRaces };