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

    const nationalityToCode = {
      'Great Britain': 'gb',
      'Italy': 'it',
      'Germany': 'de',
      'France': 'fr',
      'Switzerland': 'ch',  
      'United States': 'us' 
    };

    for (let item of championship) {
      const teamData = item.team || {};

      const countryCode = nationalityToCode[teamData.country || teamData.teamNationality || ''] || 'xx';
      const flagUrl = countryCode !== 'xx' ? `https://flagcdn.com/w64/${countryCode}.png` : null;

      const teamColor = teamColors[item.teamId] || '#000000';

      // 2025 araç resimleri (resmi F1 sitesi formatı – güncel)
      const carImageUrl = `https://media.formula1.com/image/upload/f_auto/q_auto/v1700000000/content/dam/fom-website/2025gridcars/${item.teamId}.png`;

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
          carImageUrl: carImageUrl
        },
        { upsert: true }
      );
    }

    console.log(`✅ ${championship.length} takım başarıyla güncellendi (renk + bayrak + araç resmi dahil)`);
  } catch (error) {
    console.error('❌ Team updater hatası:', error.message);
  }
}

module.exports = { updateTeams };