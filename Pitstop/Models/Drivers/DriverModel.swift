import Foundation

struct Driver: Codable, Identifiable {
    let id = UUID()
    let driverId: String
    let givenName: String
    let familyName: String
    let fullName: String
    let nationality: String
    let birthday: String?
    let number: Int?
    let shortName: String?
    let url: String?
    
    let teamName: String?
    let points: Int
    let position: Int?
    
    let imageUrl: String?
    let teamColor: String?
    let flagUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case driverId
        case givenName
        case familyName
        case fullName
        case nationality
        case birthday
        case number
        case shortName
        case url
        case teamName
        case points
        case position
        case imageUrl
        case teamColor
        case flagUrl
    }
}
