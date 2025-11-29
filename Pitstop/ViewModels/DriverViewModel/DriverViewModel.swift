import Foundation
import FirebaseStorage

@MainActor
class DriverViewModel: ObservableObject {
    @Published var drivers: [DriverModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: DriverServiceProtocol
    private let imageService = ImageService()
    
    init(service: DriverServiceProtocol = DriverService()) {
        self.service = service
    }
    
    func loadDrivers() async {
        isLoading = true
        errorMessage = nil
        
        do {
         
            var fetched = try await service.fetchDrivers()
            
        
            for index in fetched.indices {
                let driver = fetched[index]
                
        
                let photoPath = "drivers/\(driver.driverId).png"
                fetched[index].imageURL = await imageService.getImageURL(path: photoPath)
                
               
                let code = nationalityCode(from: driver.nationality)
                let flagPath = "nationality/\(code).png"
                fetched[index].flagURL = await imageService.getImageURL(path: flagPath)
            }
            
       
            self.drivers = fetched
            
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
   
    func nationalityCode(from nationality: String) -> String {
        switch nationality.lowercased() {
        case "great britain", "united kingdom": return "gbr"
        case "netherlands": return "nld"
        case "monaco": return "mco"
        case "spain": return "esp"
        case "australia": return "aus"
        case "germany": return "ger"
        case "france": return "fra"
        case "japan": return "jpn"
        case "canada": return "can"
        case "italy": return "ita"
        case "brazil": return "bra"
        case "argentina": return "arg"
        case "thailand": return "tha"
        case "new zealand": return "nzl"
        default:
            return nationality.prefix(3).lowercased()
        }
    }
}
