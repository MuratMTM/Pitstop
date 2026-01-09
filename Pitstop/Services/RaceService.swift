import Foundation

protocol RaceServiceProtocol {
    func fetchRaceCalendar() async throws -> [Race]
    func fetchRaceDetail(year: Int, round: Int) async throws -> Race
}

final class RaceService: RaceServiceProtocol {
    
    static let shared = RaceService()
    private let network = NetworkService.shared
    
    private init() {}
    

    func fetchRaceCalendar() async throws -> [Race] {
        guard let url = URL.apiURL(endpoint: "api/races") else {
            throw NetworkError.badURL
        }
        
        let races = try await network.fetch([Race].self, from: url)
        return races.sorted { $0.round < $1.round }
    }
    
  
    func fetchRaceDetail(year: Int, round: Int) async throws -> Race {
        guard let url = URL.apiURL(endpoint: "api/races/\(year)/\(round)") else {
            throw NetworkError.badURL
        }
        
        let race = try await network.fetch(Race.self, from: url)
        return race
    }
}
