import Foundation

@MainActor
class DriverChampionshipViewModel: ObservableObject {
    
    @Published var driverChampionship: [DriverChampionshipModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: DriverChampionshipServiceProtocol
    private let imageService = ImageService()
    
    init(service: DriverChampionshipServiceProtocol = DriverChampionshipService()) {
        self.service = service
    }
    
    func loadDriverChampionship() async {
        isLoading = true
        errorMessage = nil
        
        do {
            var result = try await service.fetchDriverChampionship()
            
            await withTaskGroup(of: (Int, String?, String?).self) { group in
                for index in result.indices {
                    group.addTask { [self] in
                        
                        let item = result[index]
                        
                        // driver image
                        let imagePath = "drivers/\(item.driverId).png"
                        
                        // nationality → country code
                        let nationalityFile = item.driver.nationality
                        let flagPath = "flags/\(nationalityFile).png"

                        
                        async let imageURL = imageService.getImageURL(path: imagePath)
                        async let flagURL = imageService.getImageURL(path: flagPath)
                        
                        return (index, await imageURL, await flagURL)
                    }
                }
                
                for await (index, imageURL, flagURL) in group {
                    result[index].imageURL = imageURL
                    result[index].flagURL = flagURL
                }
            }
            
            self.driverChampionship = result
            
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
