import Foundation

protocol RaceServiceProtocol {
    func fetchSchedule() async throws -> [RaceModel]
    func fetchRace(for round: Int) async throws -> RaceModel
}

final class RaceService: RaceServiceProtocol {
    
    private let network = NetworkService.shared
    private let baseURL: String = "https://f1api.dev/api"
    

    private let season = 2025

 
    func fetchSchedule() async throws -> [RaceModel] {
      
        let urlString = "\(baseURL)/current"

        
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }


        let response = try await network.fetch(RaceModelResponse.self, from: url)
        return response.races
    }


    func fetchRace(for round: Int) async throws -> RaceModel {
        
        let urlString = "\(baseURL)/\(season)/\(round)/race"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }

        let response = try await network.fetch(RaceModelResponse.self, from: url)
    
        guard let race = response.races.first else {
            throw NetworkError.badResponse
        }
        
        return race
    }
}
