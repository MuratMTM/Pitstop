const axios = require('axios');
const Circuit = require('../models/circuit');

async function updateCircuits() {
  try {
    console.log('Pist verileri çekiliyor... (f1api.dev)');

    const response = await axios.get('https://f1api.dev/api/circuits');
    const circuits = response.data.circuits || response.data; 

    for (let item of circuits) {
     
      const layoutImageUrl = `https://media.formula1.com/image/upload/f_auto/q_auto/v1700000000/content/dam/fom-website/2018-redesign-assets/Circuit%20Maps%2016x9/${item.circuitId}_Circuit.png`;

      await Circuit.findOneAndUpdate(
        { circuitId: item.circuitId },
        {
          circuitId: item.circuitId,
          circuitName: item.circuitName,
          location: item.location,
          country: item.country,
          lat: item.lat,
          lng: item.lng,
          url: item.url,
          layoutImageUrl: layoutImageUrl
        },
        { upsert: true }
      );
    }

    console.log(`✅ ${circuits.length} pist başarıyla kaydedildi (layout görseli dahil)`);
  } catch (error) {
    console.error('❌ Pist verisi çekilirken hata:', error.message);
  }
}

module.exports = { updateCircuits };