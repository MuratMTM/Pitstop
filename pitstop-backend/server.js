const express = require("express");
const mongoose = require("mongoose");
require('dotenv').config({ path: '../.env' });;
const cors = require('cors');
const path = require('path');

const { updateDrivers } = require('./updaters/driverUpdater');
const { updateTeams } = require('./updaters/teamUpdater');
const { updateCircuits } = require('./updaters/circuitUpdater');
const { updateRaces } = require('./updaters/raceUpdater');
const { updateNews } = require('./updaters/newsUpdater');

const app = express();
const PORT = process.env.PORT || 3000;


app.use(express.json());
app.use(cors()); 
app.use('/images', express.static(path.join(__dirname, 'public/images')));

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

const racesRoutes = require('./routes/races');
app.use('/api/races', racesRoutes);

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});


async function runUpdaters() {
  console.log('Updater\'lar sırayla başlıyor...');
  
  try {
    await updateDrivers();
    console.log('Drivers tamam');
  } catch (e) {
    console.error('Drivers hatası:', e.message);
  }
  
  try {
    await updateTeams();
    console.log('Teams tamam');
  } catch (e) {
    console.error('Teams hatası:', e.message);
  }
  
  try {
    await updateCircuits();
    console.log('Circuits tamam');
  } catch (e) {
    console.error('Circuits hatası:', e.message);
  }
  
  try {
    await updateRaces();
    console.log('Races tamam');
  } catch (e) {
    console.error('Races hatası:', e.message);
  }
  
  try {
    await updateNews();
    console.log('News tamam');
  } catch (e) {
    console.error('News hatası:', e.message);
  }
  
  console.log('Tüm updater\'lar tamamlandı!');
}

runUpdaters();


app.listen(PORT, () => {
  console.log(`🚀 Pitstop backend running on port ${PORT}`);
  console.log(`- News: http://localhost:${PORT}/api/news`);
  console.log(`- Drivers: http://localhost:${PORT}/api/drivers`);
   console.log(`- Drivers: http://localhost:${PORT}/api/teams`);
    console.log(`- Drivers: http://localhost:${PORT}/api/circuits`);
     console.log(`- Drivers: http://localhost:${PORT}/api/races`);
});