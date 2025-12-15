import Foundation

protocol RaceDetailRaceServiceProtocol {
    func fetchRaceDetail(season: Int, round: Int) async throws -> RaceDetailModel
}

final class RaceDetailRaceService: RaceDetailRaceServiceProtocol {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }
    
    func fetchRaceDetail(season: Int, round: Int) async throws -> RaceDetailModel {
        guard let url = URL(string: "https://f1api.dev/api/\(season)/\(round)/race") else {
            throw NetworkError.badURL
        }
        
        let response = try await networkService.fetch(
            RaceDetailResponse.self,
            from: url
        )
        
        return response.races
    }
}



