const express = require("express");
const mongoose = require("mongoose");
require('dotenv').config({ path: '../.env' });;

const app = express();
const PORT = process.env.PORT || 3000;


app.use(express.json());

mongoose.connect(process.env.MONGODB_URI)
  .then(() => console.log('MongoDB başarıyla bağlandı! pitstopdb hazır ✅'))
  .catch(err => console.error('Bağlantı hatası:', err));


const newsRoutes = require("./routes/news");
app.use("/api/news", newsRoutes);

const driversRoutes = require("./routes/drivers"); 
app.use("/api/drivers", driversRoutes);

const teamsRoutes =  require('./routes/teams')
app.use('/api/teams', teamsRoutes);

const circuitRoutes =  require('./routes/circuits')
app.use('/api/circuits', circuitRoutes);

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});


const { updateDrivers } = require('./updaters/driverUpdater');
updateDrivers(); 
const { updateTeams } = require('./updaters/teamUpdater');
updateTeams();

const { updateNews } = require('./updaters/newsUpdater');
updateNews();

const { updateCircuits } = require('./updaters/circuitUpdater');
updateCircuits();

const { updateRaces } = require('./updaters/raceUpdater');
updateRaces();


app.listen(PORT, () => {
  console.log(`🚀 Pitstop backend running on port ${PORT}`);
  console.log(`- News: http://localhost:${PORT}/api/news`);
  console.log(`- Drivers: http://localhost:${PORT}/api/drivers`);
});