import Foundation

struct RaceDetailModel: Decodable {
    
    let round: String
    let date: String
    let time: String
    let url: String
    let raceId: String
    let raceName: String
    let circuit: RaceModelCircuitModel
    
  
    let results: [RaceResultModel]
}


struct RaceDetailResponse: Decodable {
    let api: String
    let url: String
    let limit: Int
    let offset: Int
    let total: Int
    let season: Int
  
    let races: RaceDetailModel
}

struct RaceResultModel: Decodable {
    let position: LosslessInt
    let points: Int
    let grid: LosslessInt
    let time: String?
    let fastLap: FastLapDetailModel?
    let retired: String?
    

    let driver: RaceDriverModel
    let team: RaceTeamModel
}


struct RaceDriverModel: Decodable {
    let driverId: String
    let number: Int
    let shortName: String
    let url: String
    let name: String
    let surname: String
    let nationality: String
    let birthday: String
    

}


struct RaceTeamModel: Decodable {
    let teamId: String
    let teamName: String
    let nationality: String
    let firstAppareance: Int
    let constructorsChampionships: Int?
    let driversChampionships: Int?
    let url: String
}


struct FastLapDetailModel: Decodable {
    
}



