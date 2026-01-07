
import Foundation

@MainActor
class CircuitViewModel: ObservableObject {
    
    @Published var circuits: [CircuitModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: CircuitServiceProtocol
   
  
    init(service: CircuitServiceProtocol = CircuitService()){
        self.service = service
    }
     
    func loadCircuits() async {
        isLoading = true
        errorMessage = nil
         
        do {
            var result = try await service.fetchCircuits()
            

            
            self.circuits = result
            
        } catch  {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
