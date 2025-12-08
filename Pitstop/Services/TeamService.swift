
import Foundation

protocol TeamServiceProtocol {
    func fetchTeams() async throws -> [TeamModel]
}

final class TeamService: TeamServiceProtocol {
    
    private let network = NetworkService.shared
    private let baseURL = "https://f1api.dev/api/current/teams"
    
    func fetchTeams() async throws -> [TeamModel] {
        guard let url = URL(string: baseURL) else {
            throw NetworkError.badURL }
        
        let response = try await network.fetch(TeamsResponse.self, from: url)
        return response.teams
    }
    
}
