import Foundation

@MainActor
final class RaceViewModel: ObservableObject {
    @Published var races: [Race] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = RaceService.shared
    
    func loadRaceCalendar() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetched = try await service.fetchRaceCalendar()
            
       
            self.races = fetched.sorted { ($0.round ?? 999) < ($1.round ?? 999) }
        } catch {
            errorMessage = "Yarış takvimi yüklenemedi."
            print("Race fetch error:", error.localizedDescription)
        }
        
        isLoading = false
    }
    

    func refresh() async {
        await loadRaceCalendar()
    }
}


extension String {
    func toDate(format: String = "yyyy-MM-dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
