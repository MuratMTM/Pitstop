import Foundation

protocol RaceServiceProtocol {
    func fetchRaces() async throws -> RaceModel
}

final class RaceService: RaceServiceProtocol {
    
    private let network = NetworkService.shared
    private let baseURL: String = "https://f1api.dev/api/current/last/race"
    
    func fetchRaces() async throws -> RaceModel{
        guard let url = URL(string: baseURL) else {
            throw NetworkError.badURL
        }
        let response = try await network.fetch(RaceModelResponse.self, from: url)
        
        return response.races
    }
    
    
}
