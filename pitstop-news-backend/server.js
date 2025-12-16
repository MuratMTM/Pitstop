const express = require("express");
const newsRoutes = require("./routes/newsRoutes");

const app = express();
const PORT = 3000;

app.use(express.json());

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.use("/api/news", newsRoutes);

app.listen(PORT, () => {
  console.log(`🚀 Pitstop News backend running on port ${PORT}`);
});
