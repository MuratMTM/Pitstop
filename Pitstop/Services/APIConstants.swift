import Foundation

struct APIConstants {
    static let baseURL = "https://pitstop-backend-44xo.onrender.com/api"
    
    struct Endpoints {
        static let drivers = "/drivers"
        static let teams = "/teams"
        static let circuits = "/circuits"
        static let races = "/races"
        static let raceDetail = "/races/"
        static let news = "/news"
    }
}
