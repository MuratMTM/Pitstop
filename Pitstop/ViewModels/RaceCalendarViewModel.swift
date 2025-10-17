import Foundation

class RaceCalendarViewModel: ObservableObject {
    @Published var raceCalendar: [RaceCalendar] = []
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()){
        self.networkService = networkService
        
    }
    
    @MainActor
    func fetchRaceCalendar() async {
        do {
            let fetchedRaceCalendar = try await networkService.fetchRaceCalendar()
            raceCalendar = fetchedRaceCalendar
            
        }catch{
            print("Error fetching race calendar: \(error)")
        }
    }
    
    
}
