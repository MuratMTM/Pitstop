import Foundation

struct APIConstants {
    static let baseURL = "https://pitstop-backend-44xo.onrender.com"
    
    struct Endpoints {
        static let drivers = "/api/drivers"
        static let teams = "/api/teams"
        static let circuits = "/api/circuits"
        static let races = "/api/races"
        static let news = "/api/news"
        
      
        static func raceDetail(year: Int, round: Int) -> String {
            return "/api/races/\(year)/\(round)"
        }
    }
}
