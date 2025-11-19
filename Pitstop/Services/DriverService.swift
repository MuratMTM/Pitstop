import Foundation


protocol DriverServiceProtocol{
    func fetchDrivers()  async throws -> [DriverModel]
}


final class DriverService:DriverServiceProtocol{
    
    private let network = NetworkService.shared
    private let baseUrl = "https://f1api.dev/api/current/drivers"
    
    func fetchDrivers()  async throws -> [DriverModel] {
        guard let url =  URL(string: baseUrl) else{
            throw NetworkError.badURL
        }
        
        let response = try await network.fetch(DriverResponse.self, from: url)
        return response.drivers
    }
}
