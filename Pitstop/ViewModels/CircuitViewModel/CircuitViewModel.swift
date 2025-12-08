
import Foundation

@MainActor
class CircuitViewModel: ObservableObject {
    
    @Published var circuits: [CircuitModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: CircuitServiceProtocol
    private let imageService = ImageService()
  
    init(service: CircuitServiceProtocol = CircuitService()){
        self.service = service
    }
     
    func loadCircuits() async {
        isLoading = true
        errorMessage = nil
         
        do {
            var result = try await service.fetchCircuits()
            
            // 🔥 Her pist için Firebase’ten resim URL’i çek
            await withTaskGroup(of: (Int, String?).self) { group in
                for index in result.indices {
                    group.addTask { [self] in
                        let circuit = result[index]
                    
                        let path = "circuits/\(circuit.circuitId).png"
                        
                        let imageURL = await imageService.getImageURL(path: path)
                        return (index, imageURL)
                    }
                }
                
                for await (index, imageURL) in group {
                    result[index].imageURL = imageURL
                }
            }
            
            self.circuits = result
            
        } catch  {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
