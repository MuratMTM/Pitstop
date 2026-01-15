import Foundation

struct Race: Codable, Identifiable, Hashable {
    let id = UUID()
    
    let raceId: String?
    let championshipId: String?
    let raceName: String?
    let round: Int?
    let laps: Int?
    let url: String?
    
    let schedule: Schedule?
    let fastLap: FastLap?
    let circuit: CircuitInfo?
    let winner: RaceDriverInfo?
    let teamWinner: RaceTeamInfo?
    
    let podiumTop3: [PodiumItem]?
    let results: [RaceResult]?
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: Race, rhs: Race) -> Bool {
            lhs.id == rhs.id
        }
    
    enum CodingKeys: String, CodingKey {
        case raceId, championshipId, raceName, round, laps, url
        case schedule, fastLap, circuit, winner, teamWinner
        case podiumTop3, results
    }
}

struct Schedule: Codable {
    let race: EventTime?
    let qualy: EventTime?
    let fp1: EventTime?
    let fp2: EventTime?
    let fp3: EventTime?
    let sprintQualy: EventTime?
    let sprintRace: EventTime?
}

struct EventTime: Codable {
    let date: String?
    let time: String?
}

struct FastLap: Codable {
    let fastLap: String?
    let fastLapDriverId: String?
    let fastLapTeamId: String?
}

struct CircuitInfo: Codable {
    let circuitId: String?
    let circuitName: String?
    let country: String?
    let city: String?
    let circuitLength: String?
    let lapRecord: String?
    let firstParticipationYear: Int?
    let corners: Int?
    let fastestLapDriverId: String?
    let fastestLapTeamId: String?
    let fastestLapYear: Int?
    let url: String?
    let flagUrl: String?
}


struct RaceDriverInfo: Codable {
    let driverId: String?
    let name: String?
    let surname: String?
    let country: String?
    let birthday: String?
    let number: Int?
    let shortName: String?
    let url: String?
}

// Race'e özel team
struct RaceTeamInfo: Codable {
    let teamId: String?
    let teamName: String?
    let nationality: String?
    let firstAppareance: Int?
    let constructorsChampionships: Int?
    let driversChampionships: Int?
    let url: String?
}

// Podium Item
struct PodiumItem: Codable, Identifiable {
    var id: UUID { UUID() }
    let position: Int?
    let time: String?
    let points: Int?
    let driver: PodiumDriver?
    let team: PodiumTeam?
}

struct PodiumDriver: Codable {
    let driverId: String?
    let shortName: String?
    let name: String?
    let surname: String?
}

struct PodiumTeam: Codable {
    let teamId: String?
    let teamName: String?
}

// Race Result
struct RaceResult: Codable, Identifiable {
    var id: UUID { UUID() }
    
    let position: String?
    let points: Int?
    let grid: String?
    let time: String?
    let fastLap: String?
    let retired: String?
    
    let driver: RaceDriverInfo?
    let team: RaceTeamInfo?
}
