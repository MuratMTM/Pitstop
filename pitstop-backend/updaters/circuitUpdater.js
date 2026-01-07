const axios = require('axios');
const Circuit = require('../models/circuit');

async function updateCircuits() {
  try {
    console.log('Pist verileri çekiliyor...');
    const response = await axios.get('https://f1api.dev/api/circuits?limit=30');
    const circuits = response.data.circuits;

    const currentPistIds = [ // 2025 pist listesi (web'den aldım, sen ekle/çıkar)
      'bahrein', 'jeddah', 'albert_park', 'baku', 'miami', 'imola', 'monaco', 'portimao',
      'montmelo', 'red_bull_ring', 'silverstone', 'hungaroring', 'spa', 'zandvoort','sochi','paul_ricard',
      'monza', 'marina_bay', 'suzuka', 'lusail', 'austin', 'interlagos', 'vegas', 'yas_marina','istanbul','mugello','nurburgring'
    ];

    const filteredCircuits = circuits.filter(c => currentPistIds.includes(c.circuitId) && c.lapRecord); 
   
    const circuitImages = {
    
      'albert_park': 'https://pitstop-backend-44xo.onrender.com/images/circuits/albert_park.png',
      'austin': 'https://pitstop-backend-44xo.onrender.com/images/circuits/austin.png',
      'bahrein': 'https://pitstop-backend-44xo.onrender.com/images/circuits/bahrein.png',
      'baku': 'https://pitstop-backend-44xo.onrender.com/images/circuits/baku.png',
      'montmelo': 'https://pitstop-backend-44xo.onrender.com/images/circuits/montmelo.png',
      'hungaroring': 'https://pitstop-backend-44xo.onrender.com/images/circuits/hungaroring.png',
      'imola': 'https://pitstop-backend-44xo.onrender.com/images/circuits/imola.png',
      'interlagos': 'https://pitstop-backend-44xo.onrender.com/images/circuits/interlagos.png',
      'istanbul': 'https://pitstop-backend-44xo.onrender.com/images/circuits/istanbul.png',
      'jeddah': 'https://pitstop-backend-44xo.onrender.com/images/circuits/jeddah.png',
      'vegas': 'https://pitstop-backend-44xo.onrender.com/images/circuits/vegas.png',
      'lusail': 'https://pitstop-backend-44xo.onrender.com/images/circuits/lusail.png',
      'marina_bay': 'https://pitstop-backend-44xo.onrender.com/images/circuits/marina_bay.png',
      'miami': 'https://pitstop-backend-44xo.onrender.com/images/circuits/miami.png',
      'monaco': 'https://pitstop-backend-44xo.onrender.com/images/circuits/monaco.png',
      'monza': 'https://pitstop-backend-44xo.onrender.com/images/circuits/monza.png',
      'mugello': 'https://pitstop-backend-44xo.onrender.com/images/circuits/mugello.png',
      'nurburgring': 'https://pitstop-backend-44xo.onrender.com/images/circuits/nurburgring.png',
      'red_bull_ring': 'https://pitstop-backend-44xo.onrender.com/images/circuits/red_bull_ring.png',
      'silverstone': 'https://pitstop-backend-44xo.onrender.com/images/circuits/silverstone.png',
      'spa': 'https://pitstop-backend-44xo.onrender.com/images/circuits/spa.png',
      'suzuka': 'https://pitstop-backend-44xo.onrender.com/images/circuits/suzuka.png',
      'sochi': 'https://pitstop-backend-44xo.onrender.com/images/circuits/sochi.png',
      'portimao': 'https://pitstop-backend-44xo.onrender.com/images/circuits/portimao.png',
      'paul_ricard': 'https://pitstop-backend-44xo.onrender.com/images/circuits/paul_ricard.png',
      'yas_marina': 'https://pitstop-backend-44xo.onrender.com/images/circuits/yas_marina.png',
      'zandvoort': 'https://pitstop-backend-44xo.onrender.com/images/circuits/zandvoort.png'
    };

    
await Circuit.deleteMany({});
console.log('Tüm eski pist verileri silindi – yeni veriler kaydediliyor...');

    for (let circuit of circuits) {
      const circuitKey = circuit.circuitId;
      const imageUrl = circuitImages[circuitKey] || null;

      if (!imageUrl) continue;

      await Circuit.findOneAndUpdate(
        { circuitId: circuit.circuitId },
        {
         circuitId: circuit.circuitId,
          circuitName: circuit.circuitName,
          country:circuit.country,
          city: circuit.city,
          circuitLength: circuit.circuitLength || null,
          lapRecord: circuit.lapRecord || null,
          firstParticipationYear: circuit.firstParticipationYear || null,
          numberOfCorners: circuit.numberOfCorners || null,
          fastestLapDriverId: circuit.fastestLapDriverId || null,
          fastestLapTeamId: circuit.fastestLapTeamId || null,
          fastestLapYear: circuit.fastestLapYear || null,
          url: circuit.url,
          circuitImageUrl: imageUrl
        },
        { upsert: true }
      );
    }

    console.log(`✅ ${circuits.length} pist başarıyla güncellendi (statik görsel dahil)`);
  } catch (error) {
    console.error('Pist updater hatası:', error.message);
  }
}

module.exports = { updateCircuits };