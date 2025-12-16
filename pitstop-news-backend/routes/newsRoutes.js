const express = require("express");
const router = express.Router();
const { getNews } = require("../services/newsService");

router.get("/", async (req, res) => {
    try {
       const news = await getNews(); 
       res.json({
        count: news.length,
        articles: news,
       });
    } catch (error) {
       res.status(500).json({
        error: "Failed to fetch news",
       });
    }
});

module.exports = router;