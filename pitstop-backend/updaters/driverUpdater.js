const axios = require('axios');
const Driver = require('../models/driver');

async function updateDrivers() {
  try {
    console.log('Driver Championship verileri çekiliyor... (points + position dahil)');

    const response = await axios.get('https://f1api.dev/api/current/drivers-championship');
    
    const championship = response.data.drivers_championship; 

    const teamColors = {
      mclaren: '#FF8700',        
      ferrari: '#E10600',       
      red_bull: '#3671C6',       
      mercedes: '#00D2BE',      
      aston_martin: '#006F62',   
      alpine: '#0090FF',        
      rb: '#6692FF',           
      haas: '#B6BABD',          
      williams: '#005AFF',      
      sauber: '#00FF00'         
    };

    const nationalityToCode = {
  'Great Britain': 'gb',
  'Netherlands': 'nl',
  'Australia': 'au',
  'Monaco': 'mc',
  'Thailand': 'th',
  'Spain': 'es',
  'Italy': 'it',
  'France': 'fr',
  'Canada': 'ca',
  'Japan': 'jp',
  'New Zealand': 'nz',
  'Germany': 'de',
  'Brazil': 'br',
  'Argentina': 'ar'
  
};
    

    for (let item of championship) {
      const driver = item.driver;
      const team = item.team || {}; 

      const teamColor = teamColors[item.teamId] || '#000000';
      const imageUrl = `https://media.formula1.com/image/upload/f_auto/q_auto/v1700000000/content/dam/fom-website/drivers/2025Drivers/${item.driverId}.jpg`;
      const countryCode = nationalityToCode[driver.nationality] || 'xx'; 
      const flagUrl = countryCode !== 'xx' ? `https://flagcdn.com/w64/${countryCode}.png` : null;

      const fullName = `${driver.name} ${driver.surname}`;

      await Driver.findOneAndUpdate(
        { driverId: item.driverId },
        {
          givenName: driver.name,
          familyName: driver.surname,
          fullName: fullName,
          nationality: driver.nationality,
          birthday: driver.birthday,
          number: driver.number,
          shortName: driver.shortName,
          url: driver.url,

          teamName: team.teamName || item.teamId?.replace(/_/g, ' ').toUpperCase() || 'Unknown',

          points: item.points || 0,
          position: item.position || 999,
          teamColor: teamColor,
          imageUrl: imageUrl,
          flagUrl: flagUrl
       
        },
        { upsert: true }
      );
    }
    
    console.log(`✅ ${championship.length} pilot başarıyla güncellendi (points ve position dahil)`);
  } catch (error) {
    console.error('❌ Driver championship çekilirken hata:', error.message);
    if (error.response) {
      console.error('Status:', error.response.status);
    }
  }
}

module.exports = { updateDrivers };