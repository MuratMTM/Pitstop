const mongoose = require('mongoose');
const resultSchema = new mongoose.Schema({
  position: { type: String },     
  points: { type: Number },
  grid: { type: String },         
  time: { type: String },
  fastLap: { type: String, default:null },
  retired: { type: String, default: null },
  driver: {
    driverId: String,
    number: Number,
    shortName: String,
    url: String,
    name: String,
    surname: String,
    nationality: String,
    birthday: String
  },
  team: {
    teamId: String,
    teamName: String,
    nationality: String,
    firstAppareance: Number,
    constructorsChampionships: Number,
    driversChampionships: Number,
    url: String
  }
}, { _id: false });

const raceSchema = new mongoose.Schema({
  raceId: { type: String, required: true, unique: true },
  championshipId: { type: String },
  raceName: { type: String, required: true },
  round: { type: Number, required: true },
  laps: { type: Number },
  url: { type: String },
  schedule: {
    race: { date: String, time: String },
    qualy: { date: String, time: String },
    fp1: { date: String, time: String },
    fp2: { date: String, time: String },
    fp3: { date: String, time: String },
    sprintQualy: { date: String, time: String },
    sprintRace: { date: String, time: String }
  },
  fastLap: {
    fastLap: { type: String },
    fastLapDriverId: { type: String },
    fastLapTeamId: { type: String }
  },
  circuit: {
    circuitId: { type: String },
    circuitName: { type: String },
    country: { type: String },
    city: { type: String },
    circuitLength: { type: String },
    lapRecord: { type: String },
    firstParticipationYear: { type: Number },
    corners: { type: Number },
    fastestLapDriverId: { type: String },
    fastestLapTeamId: { type: String },
    fastestLapYear: { type: Number },
    url: { type: String },
    flagUrl: { type: String, default: null }

  },
  winner: {
    driverId: { type: String },
    name: { type: String },
    surname: { type: String },
    country: { type: String },
    birthday: { type: String },
    number: { type: Number },
    shortName: { type: String },
    url: { type: String }
  },
  teamWinner: {
    teamId: { type: String },
    teamName: { type: String },
    nationality: { type: String },
    firstAppareance: { type: Number },
    constructorsChampionships: { type: Number },
    driversChampionships: { type: Number },
    url: { type: String }
  },

  podiumTop3: [
  {
    position: { type: Number, required: true },  
    time: { type: String, default: null },       
    points: { type: Number, default: null },

    driver: {
      driverId: { type: String, default: null },
      shortName: { type: String, default: null },
      name: { type: String, default: null },
      surname: { type: String, default: null }
    },

    team: {
      teamId: { type: String, default: null },
      teamName: { type: String, default: null }
    }
  }
],

  results: [resultSchema] 
}, { timestamps: true });

const { resolveFlagUrl } = require('../utils/flagResolver'); 

raceSchema.pre('save', function(next) {
  if (this.circuit) {
    this.circuit.flagUrl = resolveFlagUrl(this.circuit.country);
  }
  next();
});

module.exports = mongoose.model('Race', raceSchema);