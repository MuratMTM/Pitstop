import Foundation

@MainActor
final class DriverViewModel: ObservableObject {
    @Published var drivers: [Driver] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let service = DriverService.shared
    
    func loadDrivers() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedDrivers = try await service.fetchDrivers()
            self.drivers = fetchedDrivers
        } catch {
            self.errorMessage = "Failed to load drivers."
            print("Driver fetch error:", error)
        }
        
        isLoading = false
    }
}
