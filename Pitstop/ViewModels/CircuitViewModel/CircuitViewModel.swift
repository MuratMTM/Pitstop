
import Foundation

@MainActor
 class CircuitViewModel: ObservableObject {
    
    @Published var circuits: [CircuitModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMesage: String?
    
    private let service: CircuitServiceProtocol
  
     init(service: CircuitServiceProtocol = CircuitService()){
         self.service = service
     }
     
     func loadCircuits() async {
         isLoading = true
         errorMesage = nil
         
         do {
             let result = try await service.fetchCircuits()
             self.circuits = result
         } catch  {
             self.errorMesage = error.localizedDescription
         }
         isLoading = false
     }
   
    }

