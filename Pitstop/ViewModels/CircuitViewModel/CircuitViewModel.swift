import Foundation

@MainActor
final class CircuitViewModel: ObservableObject {
    @Published var circuits: [Circuit] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service: CircuitServiceProtocol
    
    init(service: CircuitServiceProtocol = CircuitService.shared) {
        self.service = service
    }
    
    func loadCircuits() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedCircuits = try await service.fetchCircuits()
            
            let sortedCircuits = fetchedCircuits.sorted { $0.circuitName < $1.circuitName }
            
            self.circuits = sortedCircuits
        } catch {
            self.errorMessage = "Pistler yüklenemedi. Bağlantını kontrol et."
            print("Circuit fetch error:", error.localizedDescription)
        }
        
        isLoading = false
    }
    
    func refresh() async {
        await loadCircuits()
    }
}
