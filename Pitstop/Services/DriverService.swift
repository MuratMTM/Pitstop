import Foundation

protocol DriverServiceProtocol {
    func fetchDrivers() async throws -> [Driver]
}

final class DriverService: DriverServiceProtocol {
    
    static let shared = DriverService()
    
    private let network = NetworkService.shared
    
    private init() {}
    
    func fetchDrivers() async throws -> [Driver] {
        guard let url = URL.apiURL(endpoint: APIConstants.Endpoints.drivers) else {
            throw NetworkError.badURL
        }
        
        let drivers = try await network.fetch([Driver].self, from: url)
        

        return drivers.sorted { ($0.position ?? 999) < ($1.position ?? 999) }
    }
}
