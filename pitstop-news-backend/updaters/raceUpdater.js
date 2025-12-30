const axios = require('axios');
const Race = require('../models/race');

async function updateRaces() {
  try {
    console.log('2025 sezonu tüm yarış verileri çekiliyor... (f1api.dev/api/2025)');

    const response = await axios.get('https://f1api.dev/api/2025');
    const data = response.data;

    const races = data.races;

    if (!Array.isArray(races) || races.length === 0) {
      console.error('Yarış listesi boş veya array değil');
      return;
    }

    let savedCount = 0;

    for (let raceItem of races) {
      const round = raceItem.round;
      const raceName = raceItem.raceName;
      const date = raceItem.schedule.race.date + 'T' + (raceItem.schedule.race.time || '00:00:00Z');

      const circuitId = raceItem.circuit.circuitId;

      const winnerDriverId = raceItem.winner?.driverId;
      const winnerTeamId = raceItem.teamWinner?.teamId;

      const fastLapTime = raceItem.fast_lap?.fast_lap;
      const fastLapDriverId = raceItem.fast_lap?.fast_lap_driver_id;
      const fastLapTeamId = raceItem.fast_lap?.fast_lap_team_id;

      await Race.findOneAndUpdate(
        { season: 2025, round: round },
        {
          season: 2025,
          round: round,
          raceName: raceName,
          date: new Date(date),
          circuitId: circuitId,

          winnerDriverId: winnerDriverId,
          winnerTeamId: winnerTeamId,

          fastLapTime: fastLapTime,
          fastLapDriverId: fastLapDriverId,
          fastLapTeamId: fastLapTeamId,

          results: [] // Kart için boş, detay sayfada ayrı çekeceğiz
        },
        { upsert: true }
      );

      savedCount++;
    }

    console.log(`✅ ${savedCount} yarış kartı bilgisi başarıyla kaydedildi (2025 sezonu)`);
  } catch (error) {
    console.error('❌ Yarış verisi çekilirken hata:', error.message);
  }
}

module.exports = { updateRaces };