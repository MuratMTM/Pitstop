import Foundation
@MainActor

class DriverViewModel: ObservableObject {
    @Published var drivers: [DriverModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: DriverServiceProtocol
        
    init (service: DriverServiceProtocol = DriverService()) {
        self.service = service
    }
    
    func loadDrivers () async {
        isLoading = true
        errorMessage = nil
        
        do {
           let result = try await service.fetchDrivers()
            self.drivers = result
           
        } catch  {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
