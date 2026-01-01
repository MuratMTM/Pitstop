import Foundation

protocol TeamServiceProtocol {
    func fetchTeams() async throws -> [Team]
}

final class TeamService: TeamServiceProtocol {
    

    static let shared = TeamService()
    
    private let network = NetworkService.shared
    
    private init() {} 
    
    func fetchTeams() async throws -> [Team] {
        guard let url = URL.apiURL(endpoint: APIConstants.Endpoints.teams) else {
            throw NetworkError.badURL
        }
        
        let teams = try await network.fetch([Team].self, from: url)
        
        return teams.sorted { $0.position < $1.position }
    }
}
