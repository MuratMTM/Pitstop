import Foundation

@MainActor

class RaceViewModel: ObservableObject {
    @Published var vm: RaceModel?
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    
    private var service: RaceServiceProtocol
    
    init(service: RaceServiceProtocol = RaceService()){
        self.service = service
    }
    
    func loadRaces() async {
        isLoading = true
        
        do {
            let result = try await service.fetchRaces()
            
            self.vm = result
            
        } catch  {
            self.error = error.localizedDescription
        }
        
        isLoading = false
        
    }
}

