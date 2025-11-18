import Foundation

protocol CircuitServiceProtocol {
    func fetchCircuits() async throws -> [CircuitModel]
}

final class CircuitService: CircuitServiceProtocol {
    
    private let network = NetworkService.shared
    private let baseURL = "https://f1api.dev/api/circuits"
    
    func fetchCircuits() async throws -> [CircuitModel] {
        guard let url = URL(string: baseURL) else {
            throw NetworkError.badURL
        }

        let response = try await network.fetch(CircuitResponse.self, from: url)
        return response.circuits
    }
}



