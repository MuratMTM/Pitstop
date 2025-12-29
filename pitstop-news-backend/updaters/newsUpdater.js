const axios = require('axios');
const News = require('../models/news');

async function updateNews() {
  try {
    console.log('Fotoğraflı F1 haberleri çekiliyor... (NewsAPI.org)');

    const apiKey = process.env.NEWSAPI_KEY;
    if (!apiKey) {
      console.error('❌ NEWSAPI_KEY .env dosyasında tanımlı değil!');
      return;
    }

    const response = await axios.get('https://newsapi.org/v2/everything', {
      params: {
        q: 'Formula 1 OR F1 OR "Grand Prix" -football', // Futbol haberlerini hariç tut
        language: 'en',
        sortBy: 'publishedAt',
        pageSize: 50, // Daha fazla haber çekelim
        apiKey: apiKey
      },
      timeout: 15000
    });

    if (response.data.status !== 'ok') {
      console.error('NewsAPI hata döndü:', response.data.message);
      return;
    }

    const articles = response.data.articles;

    let savedCount = 0;

    for (let item of articles) {
      // Sadece fotoğraflı ve başlıklı haberleri kaydet
      if (item.urlToImage && item.title && item.url) {
        await News.findOneAndUpdate(
          { url: item.url },
          {
            title: item.title,
            summary: item.description || '',
            url: item.url,
            imageUrl: item.urlToImage,
            publishedAt: new Date(item.publishedAt),
            source: item.source.name || 'NewsAPI'
          },
          { upsert: true }
        );
        savedCount++;
      }
    }

    console.log(`✅ ${savedCount} fotoğraflı F1 haberi başarıyla kaydedildi`);
  } catch (error) {
    console.error('❌ Haber çekilirken hata:', error.message);
  }
}

module.exports = { updateNews };