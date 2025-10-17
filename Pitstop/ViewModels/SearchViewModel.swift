//import Foundation
//
//class SearchViewModel: ObservableObject {
//    @Published var searchResults: [Any] = []
//    @Published var searchText: String = ""
//    private let networkService: NetworkServiceProtocol
//    
//    init(networkService: NetworkServiceProtocol = NetworkService()){
//        self.networkService = networkService
//    }
//    
//    @MainActor
//    func search() async {
//        do {
//            let teams = try await networkService.fetchTeams()
//            let drivers = try await networkService.fetchDrivers()
//            let raceCalendar = try await networkService.fetchRaceCalendar()
//            
//            searchResults = teams.filter {
//                $0.name.lowercased().contains(searchText.lowercased())}
//            + drivers.filter {
//                $0.name.lowercased().contains(searchText.lowercased())
//            }
//            + raceCalendar.filter {
//                $0.id.lowercased().contains(searchText.lowercased()) ||
//                $0.grandPrix.lowercased().contains(searchText.lowercased())
//            }
//        }
//        
//        catch {
//            print("Error searching: \(error)")
//            
//        }
//    }
//    
//}
