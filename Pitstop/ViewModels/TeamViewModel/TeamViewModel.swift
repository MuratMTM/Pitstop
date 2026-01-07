import Foundation

@MainActor
final class TeamViewModel: ObservableObject {
    @Published var teams: [Team] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let service = TeamService.shared
    
    func loadTeams() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedTeams = try await service.fetchTeams()
            self.teams = fetchedTeams
        } catch {
            self.errorMessage = "Failed to load teams."
            print("Team fetch error:", error)
        }
        
        isLoading = false
    }
    

}
