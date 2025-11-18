import Foundation

class DriverViewModel: ObservableObject {
    @Published var drivers: [Driver] = []
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    @MainActor
    func fetchDrivers() async {
        do{
            let fetchedDrivers = try await networkService.fetchDrivers()
            drivers = fetchedDrivers
        }
        catch{
            print("Error fetching drivers: \(error)")
        }
    }
    
}
