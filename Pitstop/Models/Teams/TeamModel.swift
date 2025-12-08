import Foundation

struct TeamModel: Decodable, Identifiable {
    var id: String { teamId }
    
    let teamId: String
    let teamName: String
    let teamNationality: String
    let firstAppearance: Int
    let constructorsChampionships: Int?
    let driversChampionships: Int?
    let url: String
    var imageURL: String?
    
    init(
        teamId: String,
        teamName: String,
        teamNationality: String,
        firstAppearance: Int,
        constructorsChampionships: Int?,
        driversChampionships: Int?,
        url: String,
        imageURL: String
        
    ) {
        self.teamId = teamId
        self.teamName = teamName
        self.teamNationality = teamNationality
        self.firstAppearance = firstAppearance
        self.constructorsChampionships = constructorsChampionships
        self.driversChampionships = driversChampionships
        self.url = url
        self.imageURL = imageURL
    }
    
    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        
        teamId = try c.decode(String.self, forKey: .teamId)
        teamName = try c.decode(String.self, forKey: .teamName)
        
        // teamNationality ya da country
        if let nat = try? c.decode(String.self, forKey: .teamNationality) {
            teamNationality = nat
        } else {
            teamNationality = try c.decode(String.self, forKey: .country)
        }
        
        // firstApp(e)arance karmaşası
        firstAppearance =
            (try? c.decode(Int.self, forKey: .firstAppearance1)) ??
            (try? c.decode(Int.self, forKey: .firstAppearance2)) ??
            (try? c.decode(Int.self, forKey: .firstAppearance3)) ??
            0
        
        constructorsChampionships = try c.decodeIfPresent(Int.self, forKey: .constructorsChampionships)
        driversChampionships      = try c.decodeIfPresent(Int.self, forKey: .driversChampionships)
        url = try c.decode(String.self, forKey: .url)
    }
   
    }
 
    
    enum CodingKeys: String, CodingKey {
            case teamId
            case teamName
            case teamNationality
            case country
            case firstAppearance1 = "firstAppeareance"   // endpoint 1
            case firstAppearance2 = "firstAppareance"    // endpoint 2 (yanlış)
            case firstAppearance3 = "firstAppearance"    // olası doğru
            case constructorsChampionships
            case driversChampionships
            case url
        }
        

    
struct TeamsResponse: Decodable {
    let limit: Int
    let offset: Int
    let total: Int
    let season: Int
    let championshipId: String
    let teams: [TeamModel]
}
