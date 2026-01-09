const axios = require('axios');
const Race = require('../models/race');
const { resolveFlagUrl } = require('../utils/flagResolver'); 

// ✅ Podium hesaplayıcı
function buildPodiumTop3(results) {
  const safe = Array.isArray(results) ? results : [];

  // position "1" "2" "3" gibi geliyor → int’e çevir, sırala
  const sorted = safe
    .filter(r => r && r.position)
    .slice()
    .sort((a, b) => Number(a.position) - Number(b.position));

  const top3 = [1, 2, 3].map(pos => {
    const r = sorted.find(x => Number(x.position) === pos);

    // sonuç yoksa bile nil istemiyorsun diye “placeholder” set ediyoruz
    return {
      position: pos,
      time: r?.time ?? (pos === 1 ? "--:--.---" : "+--.---"),
      points: r?.points ?? null,
      driver: {
        driverId: r?.driver?.driverId ?? "TBD",
        shortName: r?.driver?.shortName ?? "TBD",
        name: r?.driver?.name ?? "TBD",
        surname: r?.driver?.surname ?? ""
      },
      team: {
        teamId: r?.team?.teamId ?? "tbd",
        teamName: r?.team?.teamName ?? "TBD"
      }
    };
  });

  return top3;
}

async function updateRaces() {
  try {
    console.log('Yarış takvimi verileri çekiliyor... (f1api.dev)');
    const response = await axios.get('https://f1api.dev/api/current');
    const races = response.data.races;

    for (let race of races) {
      const year = 2025;
      const round = race.round;

      let results = [];
      try {
        const detailResponse = await axios.get(
          `https://f1api.dev/api/${year}/${round}/race`
        );
        results = detailResponse.data.races.results || [];
      } catch (detailError) {
        console.error(
          `Yarış detayı hatası (round ${round}):`,
          detailError.message
        );
      }

     
      const circuitWithFlag = {
        ...race.circuit,
        flagUrl: resolveFlagUrl(race.circuit?.country)
      };

       const podiumTop3 = buildPodiumTop3(results);

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
          circuit: circuitWithFlag, 
          winner: race.winner,
          teamWinner: race.teamWinner,
          results: results,
            podiumTop3: podiumTop3
        },
        { upsert: true, new: true }
      );
    }

    console.log(`✅ ${races.length} yarış başarıyla güncellendi`);
  } catch (error) {
    console.error('❌ Race updater hatası:', error.message);
  }
}

module.exports = { updateRaces };
