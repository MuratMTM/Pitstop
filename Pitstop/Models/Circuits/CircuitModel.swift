import Foundation

struct Circuit: Codable,Identifiable,Hashable {
    let id = UUID()
    
    let circuitId: String
    let circuitName: String
    let country: String
    let city: String
    
    let circuitLength: Int?
    let lapRecord: String?
    let firstParticipationYear: Int?
    let numberOfCorners: Int?
    
    let fastestLapDriverId: String?
    let fastestLapTeamId: String?
    let fastestLapYear: Int?
    
    let url: String?
    let circuitImageUrl: String?
    let flagUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case circuitId, circuitName, country, city
        case circuitLength, lapRecord, firstParticipationYear, numberOfCorners
        case fastestLapDriverId, fastestLapTeamId, fastestLapYear
        case url, circuitImageUrl,flagUrl
    }
}
