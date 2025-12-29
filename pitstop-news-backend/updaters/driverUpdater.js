
const axios = require('axios');
const Driver = require('../models/driver');

async function updateDrivers() {
  try {
    console.log('Pilot verileri çekiliyor... (f1api.dev)');
    
    // Senin API endpoint'in
    const response = await axios.get('https://f1api.dev/api/current/drivers');
    
    const drivers = response.data.drivers; 

    for (let item of drivers) {
      const fullName = `${item.name} ${item.surname}`;

      await Driver.findOneAndUpdate(
        { driverId: item.driverId }, 
        {
          givenName: item.name,
          familyName: item.surname,
          fullName: fullName,
          nationality: item.nationality,
          birthday: item.birthday,
          number: item.number,
          shortName: item.shortName,
          url: item.url,
          teamId: item.teamId,
      
        },
        { upsert: true } 
      );
    }
    
    console.log(`✅ ${drivers.length} pilot başarıyla kaydedildi/güncellendi!`);
  } catch (error) {
    console.error('❌ Veri çekilirken hata:', error.message);
    if (error.response) {
      console.error('Response status:', error.response.status);
    }
  }
}

module.exports = { updateDrivers };