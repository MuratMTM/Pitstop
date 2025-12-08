import Foundation

@MainActor
class TeamViewModel: ObservableObject {
    @Published var teams: [TeamModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: TeamServiceProtocol
    private let imageService = ImageService()
    
    init(service: TeamServiceProtocol = TeamService()){
        self.service = service
    }
    
    func loadTeams() async {
        isLoading = true
        errorMessage = nil
        
        do {
            var result = try await service.fetchTeams()
            
            await withTaskGroup(of: (Int, String?).self) { group in
                for index in result.indices {
                    group.addTask { [self] in
                        let teams = result[index]
                    
                        let path = "teams/\(teams.teamId).png"
                        
                        let imageURL = await imageService.getImageURL(path: path)
                        return (index, imageURL)
                    }
                }
                
                for await (index, imageURL) in group {
                    result[index].imageURL = imageURL
                }
            }
            
            self.teams = result
        } catch  {
            self.errorMessage = error.localizedDescription 
        }
        isLoading = false
    }
}


