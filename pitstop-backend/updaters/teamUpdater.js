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

const staticTeamData = {
  mclaren: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/mclaren-diagonal.jpeg', 
    backgroundColorHex: '#F9883E',
    cardGradientHex: ['#F9883E', '#E81C25', '#448BF2']
  },
  ferrari: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/ferrari-diagonal.jpeg',
    backgroundColorHex: '#E81C25',
    cardGradientHex: ['#E81C25', '#113264', '#FF9E44']
  },
  red_bull: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/red_bull-diagonal.jpeg',
    backgroundColorHex: '#448BF2',
    cardGradientHex: ['#448BF2', '#FE3131', '#F6F7F9']
  },
  mercedes: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/mercedes-diagonal.jpeg',
    backgroundColorHex: '#113264',
    cardGradientHex: ['#113264', '#FF9E44', '#FE3131']
  },
  aston_martin: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/aston_martin-diagonal.jpeg',
    backgroundColorHex: '#FF9E44',
    cardGradientHex: ['#FF9E44', '#FE3131', '#F6F7F9']
  },
  alpine: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/alpine-diagonal.jpeg',
    backgroundColorHex: '#FE3131',
    cardGradientHex: ['#FE3131', '#F6F7F9', '#000000']
  },
  rb: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/rb-diagonal.jpeg',
    backgroundColorHex: '#F6F7F9',
    cardGradientHex: ['#F6F7F9', '#000000', '#F9883E']
  },
  haas: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/haas-diagonal.jpeg',
    backgroundColorHex: '#000000',
    cardGradientHex: ['#000000', '#F9883E', '#E81C25']
  },
  williams: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/williams-diagonal.jpeg',
    backgroundColorHex: '#F9883E',
    cardGradientHex: ['#F9883E', '#E81C25', '#448BF2']
  },
  sauber: {
    diagonalCarImageUrl: 'https://pitstop-backend-44xo.onrender.com/images/teams/sauber-diagonal.jpeg',
    backgroundColorHex: '#E81C25',
    cardGradientHex: ['#E81C25', '#448BF2', '#113264']
  }
};
    

    
  const flagUrls = {
  'Great Britain': 'https://flagcdn.com/w320/gb.png',
  'Italy': 'https://flagcdn.com/w320/it.png',
  'Germany': 'https://flagcdn.com/w320/de.png',
  'France': 'https://flagcdn.com/w320/fr.png',
  'Switzerland': 'https://flagcdn.com/w320/ch.png',
  'United States': 'https://flagcdn.com/w320/us.png',
  'Austria': 'https://flagcdn.com/w320/at.png'
};

for (let item of championship) {
  const teamData = item.team || {};
  const teamColor = teamColors[item.teamId] || '#000000';
  const staticData = staticTeamData[item.teamId] || {};

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
      flagUrl: flagUrls[teamData.country || teamData.teamNationality || ''] || null,
      teamLogoUrl: teamLogos[item.teamId] || null,
      carImageUrl: carImages[item.teamId] || null,
      diagonalCarImageUrl: staticData.diagonalCarImageUrl || null,
    backgroundColorHex: staticData.backgroundColorHex || '#000000',
    cardGradientHex: staticData.cardGradientHex || ['#000000', '#000000']
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