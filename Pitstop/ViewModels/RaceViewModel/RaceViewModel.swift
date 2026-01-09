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
            self.races = fetched
        } catch {
            errorMessage = "Yarış takvimi yüklenemedi."
            print("Race fetch error:", error)
        }
        
        isLoading = false
    }
}
