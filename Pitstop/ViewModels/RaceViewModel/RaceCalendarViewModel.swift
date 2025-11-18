import Foundation

class RaceCalendarViewModel: ObservableObject {
//    @Published var raceCalendar: [RaceCalendar] = []
//    private let networkService: NetworkServiceProtocol
//    
//    init(networkService: NetworkServiceProtocol = NetworkService()){
//        self.networkService = networkService
//        
//    }
//    
//    @MainActor
//    func fetchRaceCalendar() async {
//        do {
//            let fetchedRaceCalendar = try await networkService.fetchRaceCalendar()
//            raceCalendar = fetchedRaceCalendar
//            
//        }catch{
//            print("Error fetching race calendar: \(error)")
//        }
//    }
//    
    
     let mockCalendar: [RaceCalendar] = [
        RaceCalendar(id: "BAH", grandPrix: "Bahrain Grand Prix", location: "Bahrain", trackImageName: "bahrain_gp", date: "07 - 09 Mart", whoWon: "Max Verstappen", qualification: ["Q1", "Q2", "Q3"], history: "Sakhir pisti bilgisi"),
        
        RaceCalendar(id: "JED", grandPrix: "Saudi Arabian GP", location: "Saudi Arabia", trackImageName: "saudi_arabia_gp", date: "14 - 16 Mart", whoWon: "Max Verstappen", qualification: ["Q1", "Q2", "Q3"], history: "Jeddah pisti bilgisi"),
        
        RaceCalendar(id: "AUS", grandPrix: "Australian Grand Prix", location: "Australia", trackImageName: "australia_gp", date: "28 - 30 Mart", whoWon: "Carlos Sainz", qualification: ["Q1", "Q2", "Q3"], history: "Melbourne pisti bilgisi"),
        RaceCalendar(id: "JPN", grandPrix: "Japanese Grand Prix", location: "Japan", trackImageName: "japan_gp", date: "04 - 06 Nisan", whoWon: "Lando Norris", qualification: ["Q1", "Q2", "Q3"], history: "Suzuka pisti bilgisi"),
        RaceCalendar(id: "MON", grandPrix: "Monaco Grand Prix", location: "Monaco", trackImageName: "monaco_gp", date: "23 - 25 Mayıs", whoWon: "Charles Leclerc", qualification: ["Q1", "Q2", "Q3"], history: "Monte Carlo pisti bilgisi")
    ]

    
}

