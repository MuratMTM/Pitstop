import Foundation

protocol RaceServiceProtocol {
    func fetchSchedule() async throws -> [RaceModel]
    func fetchRace(for round: Int) async throws -> RaceModel
}

final class RaceService: RaceServiceProtocol {
    
    private let network = NetworkService.shared
    private let baseURL: String = "https://f1api.dev/api"
    private let season = 2025
    
    private let imageService: ImageService
    init(imageService: ImageService = ImageService()) {
        self.imageService = imageService
    }

    func fetchSchedule() async throws -> [RaceModel] {
        
        let urlString = "\(baseURL)/current"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }

        let response = try await network.fetch(RaceModelResponse.self, from: url)
        
        var racesWithImages = [RaceModel]()
        
        for var race in response.races {
            await updateRaceWinnerImageURL(raceToUpdate: &race)
            racesWithImages.append(race)
        }
        
        return racesWithImages 
    }

    func fetchRace(for round: Int) async throws -> RaceModel {
        
        let urlString = "\(baseURL)/\(season)/\(round)/race"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }

        let response = try await network.fetch(RaceModelResponse.self, from: url)
    
        guard var race = response.races.first else {
            throw NetworkError.badResponse
        }
        
        await updateRaceWinnerImageURL(raceToUpdate: &race)
        
        return race
    }
}

extension RaceService {

    private func updateRaceWinnerImageURL(raceToUpdate: inout RaceModel) async {

        guard let winner = raceToUpdate.winner else {
            return 
        }

        let winnerId = winner.driverId
        
    
        guard !winnerId.isEmpty else {
            return
        }

        let driverURL = await imageService.getImageURL(path: "drivers/\(winnerId).png")

        if let finalDriverURL = driverURL {
         
            raceToUpdate.winner!.driverImageURL = finalDriverURL
        }
    }
}
