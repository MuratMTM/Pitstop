import Foundation

struct Race: Codable, Identifiable {
    let id = UUID()
    
    let raceId: String
    let championshipId: String?
    let raceName: String
    let round: Int
    let laps: Int?
    let url: String?
    
    let schedule: Schedule?
    let fastLap: FastLap?
    let circuit: Circuit?
    
    let winner: Driver?
    let teamWinner: Team?
    
    let results: [RaceResult]?
    let podiumTop3: [PodiumItem]?

    
    enum CodingKeys: String, CodingKey {
            case raceId, championshipId, raceName, round, laps, url
            case schedule, fastLap, circuit, winner, teamWinner, results,podiumTop3
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

struct RaceResult: Codable, Identifiable {
    let id = UUID()
    let position: String?
    let points: Int?
    let grid: String?
    let time: String?
    let fastLap: String?
    let retired: String?
    
    let driver: Driver?
    let team: Team?
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            position = try container.decodeIfPresent(String.self, forKey: .position)
            points = try container.decodeIfPresent(Int.self, forKey: .points)
            grid = try container.decodeIfPresent(String.self, forKey: .grid)
            time = try container.decodeIfPresent(String.self, forKey: .time)
            fastLap = try container.decodeIfPresent(String.self, forKey: .fastLap)
            retired = try container.decodeIfPresent(String.self, forKey: .retired)
            driver = try container.decodeIfPresent(Driver.self, forKey: .driver)
            team = try container.decodeIfPresent(Team.self, forKey: .team)
        }
}


struct PodiumItem: Codable, Identifiable {
    let id = UUID()
    let position: Int
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
