const axios = require('axios');
const Team = require('../models/team');

async function updateTeams() {
  try {
    console.log('Takım şampiyonası verileri çekiliyor...');

    const response = await axios.get('https://f1api.dev/api/current/constructors-championship');
    const championship = response.data.constructors_championship;

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

   
    const teamLogos = {
      mclaren: 'https://pitstop-backend-44xo.onrender.com/images/teams/mclaren-logo.png',
      ferrari: 'https://pitstop-backend-44xo.onrender.com/images/teams/ferrari-logo.png',
      red_bull: 'https://pitstop-backend-44xo.onrender.com/images/teams/red_bull-logo.png',
      mercedes: 'https://pitstop-backend-44xo.onrender.com/images/teams/mercedes-logo.png',
      aston_martin: 'https://pitstop-backend-44xo.onrender.com/images/teams/aston_martin-logo.png',
      alpine: 'https://pitstop-backend-44xo.onrender.com/images/teams/alpine-logo.png',
      rb: 'https://pitstop-backend-44xo.onrender.com/images/teams/rb-logo.png',
      haas: 'https://pitstop-backend-44xo.onrender.com/images/teams/haas-logo.png',
      williams: 'https://pitstop-backend-44xo.onrender.com/images/teams/williams-logo.png',
      sauber: 'https://pitstop-backend-44xo.onrender.com/images/teams/sauber-logo.png'
    };


    const carImages = {
      mclaren: 'https://pitstop-backend-44xo.onrender.com/images/teams/mclaren-car.png',
      ferrari: 'https://pitstop-backend-44xo.onrender.com/images/teams/ferrari-car.png',
      red_bull: 'https://pitstop-backend-44xo.onrender.com/images/teams/red_bull-car.png',
      mercedes: 'https://pitstop-backend-44xo.onrender.com/images/teams/mercedes-car.png',
      aston_martin: 'https://pitstop-backend-44xo.onrender.com/images/teams/aston_martin-car.png',
      alpine: 'https://pitstop-backend-44xo.onrender.com/images/teams/alpine-car.png',
      rb: 'https://pitstop-backend-44xo.onrender.com/images/teams/rb-car.png',
      haas: 'https://pitstop-backend-44xo.onrender.com/images/teams/haas-car.png',
      williams: 'https://pitstop-backend-44xo.onrender.com/images/teams/williams-car.png',
      sauber: 'https://pitstop-backend-44xo.onrender.com/images/teams/sauber-car.png'
    };

    const flagUrls = {
    'Great Britain': 'https://countryflagsapi.com/png/gb',
    'Italy': 'https://countryflagsapi.com/png/it',
    'Germany': 'https://countryflagsapi.com/png/de',
    'France': 'https://countryflagsapi.com/png/fr',
    'Switzerland': 'https://countryflagsapi.com/png/ch',
    'United States': 'https://countryflagsapi.com/png/us',
    'Austria': 'https://countryflagsapi.com/png/at'
};

    for (let item of championship) {
      const teamData = item.team || {};
      const countryCode = nationalityToCode[teamData.country || teamData.teamNationality || ''] || 'xx';
      const flagUrl = flagUrls[teamData.country || teamData.teamNationality] || null;
      const teamColor = teamColors[item.teamId] || '#000000';

      await Team.findOneAndUpdate(
        { teamId: item.teamId },
        {
          teamName: teamData.teamName || item.teamId.replace(/_/g, ' ').toUpperCase(),
          teamNationality: teamData.country || '',
          firstAppeareance: teamData.firstAppareance || teamData.firstAppearance,
          constructorsChampionships: teamData.constructorsChampionships || 0,
          driversChampionships: teamData.driversChampionships || 0,
          url: teamData.url,
          points: item.points || 0,
          position: item.position || 999,
          wins: item.wins || 0,
          teamColor: teamColor,
          flagUrl: flagUrl,
          teamLogoUrl: teamLogos[item.teamId] || null,
          carImageUrl: carImages[item.teamId] || null 
        },
        { upsert: true }
      );
    }

    console.log(`✅ ${championship.length} takım başarıyla güncellendi (statik logo + araç resmi dahil)`);
  } catch (error) {
    console.error('❌ Team updater hatası:', error.message);
  }
}

module.exports = { updateTeams };