import Foundation

protocol CircuitServiceProtocol {
    func fetchCircuits() async throws -> [Circuit]
}

final class CircuitService: CircuitServiceProtocol {
    static let shared = CircuitService()
    private let network = NetworkService.shared
    
    private init() {}
    
    func fetchCircuits() async throws -> [Circuit] {
        guard let url = URL.apiURL(endpoint: APIConstants.Endpoints.circuits) else {
            throw NetworkError.badURL
        }
        
        let circuits = try await network.fetch([Circuit].self, from: url)
        
        return circuits
    }
}   
