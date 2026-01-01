import Foundation

struct Team: Codable, Identifiable {
    let id = UUID() 
    let teamId: String
    let teamName: String
    let teamNationality: String?
    let firstAppeareance: Int?
    let constructorsChampionships: Int
    let driversChampionships: Int
    let url: String?
    
    let points: Int
    let position: Int
    let wins: Int
    
    let teamColor: String?
    let flagUrl: String?
    let carImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case teamId
        case teamName
        case teamNationality
        case firstAppeareance
        case constructorsChampionships
        case driversChampionships
        case url
        case points
        case position
        case wins
        case teamColor
        case flagUrl
        case carImageUrl
    }
}
