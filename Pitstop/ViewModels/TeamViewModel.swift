

import Foundation

class TeamViewModel: ObservableObject {
    @Published var teams: [Team] = []
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    @MainActor
    func fetchTeams() async {
        do {
            let fetchedTeams = try await networkService.fetchTeams()
            teams = fetchedTeams
        } catch {
            print("Error fetching teams: \(error)")
        }
    }
    
}
