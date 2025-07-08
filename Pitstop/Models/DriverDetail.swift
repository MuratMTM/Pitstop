import Foundation

struct DriverDetailModel: Identifiable, Codable {
    let id: String
    let baseDriver: Driver
    let biography: String
    let birthDate: String
    let birthPlace: String
   let grandPrixes:[GrandPrixResult]
    let lastSeasonStatistics: [String]
    let records: [String]
    let driverNews: [String]
}


struct GrandPrixResult: Identifiable, Codable {
    var id = UUID()
    let name: String
    let position: String
    let points: Int
}
