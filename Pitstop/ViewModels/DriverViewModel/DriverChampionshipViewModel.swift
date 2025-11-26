import Foundation

@MainActor

class DriverChampionshipViewModel: ObservableObject {
    
    @Published var driverChampionship: [DriverChampionshipModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: Error?
    
    private let service: DriverChampionshipServiceProtocol
    
    
    init (service:DriverChampionshipServiceProtocol = DriverChampionshipService()) {
        self.service = service
    }
    
    func loadDriverChampionship() async {
        isLoading = true
        do {
            driverChampionship = try await service.fetchDriverChampionship()
            
         
        } catch {
            self.errorMessage = error
        }
        isLoading = false
    }
    
}
