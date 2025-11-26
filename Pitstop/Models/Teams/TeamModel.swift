import Foundation

struct TeamModel: Decodable {
    let teamId: String
    let teamName: String
    let teamNationality: String
    let firstAppearance: Int
    let constructorChampionships: Int?
    let driverChampionships: Int?
    let url: String
}

struct TeamResponse: Decodable {
    let limit: Int
    let offset: Int
    let total: Int
    let season: Int
    let championshipId: String
    let teams: [TeamModel]
}
