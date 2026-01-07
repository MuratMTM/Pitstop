const Parser = require('rss-parser');
const parser = new Parser({
  customFields: {
    item: [
      ['media:content', 'media'],
      ['enclosure', 'enclosure'],
      ['description', 'description']
    ]
  }
});

const News = require('../models/news');

async function updateNews() {
  try {
    
    console.log('F1 haberleri çekiliyor... (Autosport.com F1 RSS)');

    const feed = await parser.parseURL('https://www.autosport.com/rss/f1/news');

    const scrapedNews = [];

    for (let item of feed.items) {
      let imageUrl = null;

   
      if (item.enclosure && item.enclosure.url) {
        imageUrl = item.enclosure.url;
      } else if (item.media && item.media['$'] && item.media['$'].url) {
        imageUrl = item.media['$'].url;
      } else if (item.content && item.content.includes('<img')) {
        const match = item.content.match(/src=["']([^"']+)["']/);
        if (match) imageUrl = match[1];
      }

      scrapedNews.push({
        title: item.title || 'F1 Haberi',
        summary: item.contentSnippet || item.summary || '',
        url: item.link,
        imageUrl: imageUrl,
        publishedAt: item.pubDate ? new Date(item.pubDate) : new Date(),
        source: 'Autosport F1'
      });
    }

    // En yeni 30 haber
    const latestNews = scrapedNews.slice(0, 30);

    for (let item of latestNews) {
      await News.findOneAndUpdate(
        { url: item.url },
        {
          title: item.title,
          summary: item.summary,
          url: item.url,
          imageUrl: item.imageUrl,
          publishedAt: item.publishedAt,
          source: item.source
        },
        { upsert: true }
      );
    }

    console.log(`✅ ${latestNews.length} gerçek F1 haberi kaydedildi (Autosport RSS)`);
  } catch (error) {
    console.error('❌ F1 haber hatası:', error.message);
  }
}

module.exports = { updateNews };