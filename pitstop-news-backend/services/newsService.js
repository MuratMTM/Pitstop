const Parser = require("rss-parser");
const parser = new Parser();

const RSS_URL = "https://www.motorsport.com/rss/f1/news/" ; 

let cache = {
    data: null,
    lastFatched: null,
};

const CACHE_DURATION = 1000 * 60 * 5;

async function getNews() {
    const now = Date.now();

    if(cache.data && now - cache.lastFatched < CACHE_DURATION){
        return cache.data;
    }

    const feed = await parser.parseURL(RSS_URL);

    const articles = feed.items.slice(0, 20).map((item, index) => ({
         id: `${index}-${Date.now()}`,
    title: item.title ?? "",
    summary: item.contentSnippet ?? "",
    image: item.enclosure?.url ?? null,
    source: "Motorsport",
    publishedAt: item.pubDate ?? "",
    url: item.link,
    }));

    cache = {
        data: articles,
        lastFatched: now,
    };

    return articles;
}

module.exports = { getNews };