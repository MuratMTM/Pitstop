import Foundation

struct DriverChampionshipModel: Decodable, Identifiable {
    var id: String {driverId}
    
    let classificationId: Int
    let driverId: String
    let teamId: String
    let points: Int
    let position: Int
    let wins: Int
    let driver: [DriverModel]
    let teams: [TeamModel]
    
    var imageURL: String?
}

struct DriverChampionshipResponse: Decodable {
    let limit: Int
    let offset: Int
    let total: Int
    let season: Int
    let championshipId: String
    let driverChampionship: [DriverChampionshipModel]
    
}
