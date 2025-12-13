

import Foundation

struct RaceModel: Decodable {
    let raceId: String
    let championshipId: String
    let raceName: String
    let schedule: RaceScheduleModel
    let laps: Int
    let round: Int
    let url: String
    let fast_lap: FastLapModel
    var circuit: RaceModelCircuitModel
    var winner: WinnerModel?
    var teamWinner: RaceModelChampionshipTeam?
    
    
}

struct RaceModelResponse: Decodable {
    let api: String
    let url: String
    let limit: Int
    let offset: Int
    let total: Int
    let season: Int
    let championship: ChampionshipModel
    let races: [RaceModel]
}

struct ChampionshipModel: Decodable {
    let championshipId: String
    let championshipName: String
    let url: String
    let year: Int
    
}

struct RaceScheduleModel: Decodable{
    let race: DateModel
    let qualy: DateModel
    let fp1: DateModel
    let fp2: DateModel?
    let fp3: DateModel?
    let sprintQualy: DateModel?
    let sprintRace: DateModel?
}

struct DateModel: Decodable {
    let date: String?
    let time: String?
}

struct FastLapModel: Decodable {
    let fast_lap: String?
    let fast_lap_driver_id: String?
    let fast_lap_team_id: String?
    
}

struct WinnerModel: Decodable {
    let driverId: String
    let name: String
    let surname: String
    let country: String
    let birthday: String
    let number: Int
    let shortName: String
    let url: String
    
    var driverImageURL: String?
    
}

struct RaceModelCircuitModel: Decodable {
    let circuitId: String
    let circuitName: String
    let country: String
    let city: String
    
    let circuitLength: String
    let lapRecord: String?
    let firstParticipationYear: Int?
    let corners: Int
    
    
    let fastestLapDriverId: String?
    let fastestLapTeamId: String?
    let fastestLapYear: Int?
    
    let url: String
    
    var imageURL: String?
    var circuitFlagURL: String?
}

struct RaceModelChampionshipTeam: Decodable {
    let teamId: String
    let teamName: String
    let country: String
    let firstAppearance: Int
    let constructorsChampionships: Int?
    let driversChampionships: Int?
    let url: String
}

func updateRaceWinnerImageURL(raceToUpdate: inout RaceModel, imageService: ImageService) async {
    
    
    guard let winner = raceToUpdate.winner else {
        return
    }
    
    let winnerId = winner.driverId
    
    
    guard !winnerId.isEmpty else {
        return
        
        
        let driverURL = await imageService.getImageURL(path: "drivers/\(winnerId).png")
        
        
        if let finalDriverURL = driverURL {
            
            raceToUpdate.winner!.driverImageURL = finalDriverURL
        }
    }
}
