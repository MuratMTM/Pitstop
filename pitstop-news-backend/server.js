const express = require("express");

const app = express();
const PORT = 3000;

// Middleware (şimdilik sadece JSON)
app.use(express.json());

// Health check endpoint
app.get("/health", (req, res) => {
  res.json({
    status: "ok",
    service: "Pitstop News Backend",
  });
});


app.listen(PORT, () => {
  console.log(`🚀 Pitstop News backend running on port ${PORT}`);
});
