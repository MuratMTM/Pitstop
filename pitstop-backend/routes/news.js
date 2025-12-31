const express = require("express");
const router = express.Router();
const News = require("../models/news");


router.get("/", async (req, res) => {
  try {
    const news = await News.find()
      .sort({ publishedAt: -1 }) 
      .limit(30);

    res.json({
      count: news.length,
      articles: news,
    });
  } catch (error) {
    console.error('Haberler getirilirken hata:', error);
    res.status(500).json({
      error: "Failed to fetch news",
    });
  }
});

module.exports = router;