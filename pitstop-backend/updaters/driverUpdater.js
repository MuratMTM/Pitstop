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

  
    const flagUrls = {
      'Great Britain': 'https://pitstop-backend-44xo.onrender.com/images/flags/gb.png',
      'Netherlands': 'https://pitstop-backend-44xo.onrender.com/images/flags/nl.png',
      'Brazil': 'https://pitstop-backend-44xo.onrender.com/images/flags/br.png',
      'Argentina': 'https://pitstop-backend-44xo.onrender.com/images/flags/ar.png',
      'Australia': 'https://pitstop-backend-44xo.onrender.com/images/flags/au.png',
      'Spain': 'https://pitstop-backend-44xo.onrender.com/images/flags/es.png',
      'Canada': 'https://pitstop-backend-44xo.onrender.com/images/flags/ca.png',
      'Japan': 'https://pitstop-backend-44xo.onrender.com/images/flags/jp.png',
      'China': 'https://pitstop-backend-44xo.onrender.com/images/flags/cn.png',
      'France': 'https://pitstop-backend-44xo.onrender.com/images/flags/fr.png',
      'Mexico': 'https://pitstop-backend-44xo.onrender.com/images/flags/mx.png',
      'Thailand': 'https://pitstop-backend-44xo.onrender.com/images/flags/th.png',
      'Denmark': 'https://pitstop-backend-44xo.onrender.com/images/flags/dk.png',
      'Finland': 'https://pitstop-backend-44xo.onrender.com/images/flags/fi.png',
      'Germany': 'https://pitstop-backend-44xo.onrender.com/images/flags/de.png',
      'Monaco': 'https://pitstop-backend-44xo.onrender.com/images/flags/mc.png',
      'Italy': 'https://pitstop-backend-44xo.onrender.com/images/flags/it.png',
      'New Zealand': 'https://pitstop-backend-44xo.onrender.com/images/flags/nz.png'
    };

    const driverImages = {
      'max_verstappen': 'https://pitstop-backend-44xo.onrender.com/images/drivers/verstappen.jpeg',
      'norris': 'https://pitstop-backend-44xo.onrender.com/images/drivers/norris.jpg',
      'leclerc': 'https://pitstop-backend-44xo.onrender.com/images/drivers/leclerc.jpg',
      'piastri': 'https://pitstop-backend-44xo.onrender.com/images/drivers/piastri.jpg',
      'sainz': 'https://pitstop-backend-44xo.onrender.com/images/drivers/sainz.jpg',
      'hamilton': 'https://pitstop-backend-44xo.onrender.com/images/drivers/hamilton.jpg',
      'russell': 'https://pitstop-backend-44xo.onrender.com/images/drivers/russell.jpg',
      'antonelli': 'https://pitstop-backend-44xo.onrender.com/images/drivers/antonelli.jpg',
      'perez': 'https://pitstop-backend-44xo.onrender.com/images/drivers/perez.jpeg',
      'alonso': 'https://pitstop-backend-44xo.onrender.com/images/drivers/alonso.jpg',
      'stroll': 'https://pitstop-backend-44xo.onrender.com/images/drivers/stroll.jpg',
      'hulkenberg': 'https://pitstop-backend-44xo.onrender.com/images/drivers/hulkenberg.jpg',
      'ocon': 'https://pitstop-backend-44xo.onrender.com/images/drivers/ocon.jpeg',
      'gasly': 'https://pitstop-backend-44xo.onrender.com/images/drivers/gasly.jpg',
      'hadjar': 'https://pitstop-backend-44xo.onrender.com/images/drivers/hadjar.jpg',
      'tsunoda': 'https://pitstop-backend-44xo.onrender.com/images/drivers/tsunoda.jpg',
      'lawson': 'https://pitstop-backend-44xo.onrender.com/images/drivers/lawson.jpeg',
      'albon': 'https://pitstop-backend-44xo.onrender.com/images/drivers/albon.jpg',
      'colapinto': 'https://pitstop-backend-44xo.onrender.com/images/drivers/colapinto.jpeg',
      'bottas': 'https://pitstop-backend-44xo.onrender.com/images/drivers/bottas.jpeg',
      'bearman': 'https://pitstop-backend-44xo.onrender.com/images/drivers/bearman.jpg',
      'doohan': 'https://pitstop-backend-44xo.onrender.com/images/drivers/doohan.jpg',
      'bortoleto': 'https://pitstop-backend-44xo.onrender.com/images/drivers/bortoleto.jpg',
      

    };

    //(await Driver.updateMany({}, { $set: { imageUrl: null, flagUrl: null } });

    for (let item of championship) {
      const driver = item.driver || {};
      const team = item.team || {};
      const teamColor = teamColors[item.teamId] || '#000000';

      const driverKey = item.driverId || driver.driverId || `${driver.givenName || driver.name}_${driver.familyName || driver.surname}`.toLowerCase();

      const imageUrl = driverImages[driverKey] || null;
      const flagUrl = flagUrls[driver.nationality] || null;

      const fullName = `${driver.givenName || driver.name} ${driver.familyName || driver.surname}`;

      await Driver.findOneAndUpdate(
        { driverId: item.driverId || driver.driverId },
        {
          givenName: driver.givenName || driver.name,
          familyName: driver.familyName || driver.surname,
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

    console.log(`✅ ${championship.length} pilot başarıyla güncellendi (statik foto + bayrak dahil)`);
  } catch (error) {
    console.error('❌ Driver updater hatası:', error.message);
  }
}

module.exports = { updateDrivers };