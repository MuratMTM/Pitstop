import Foundation

@MainActor
final class RaceDetailViewModel: ObservableObject {
    
    @Published var raceDetail: RaceDetailModel?
    @Published var results: [RaceResultModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let season: Int
    private let round: Int
    private let service: RaceDetailRaceServiceProtocol
    
    init(
        season: Int,
        round: Int,
        service: RaceDetailRaceServiceProtocol = RaceDetailRaceService()
    ) {
        self.season = season
        self.round = round
        self.service = service
    }

    func fetchRaceDetail() async {
        print("🔥 Fetching race detail → season:", season, "round:", round)
        
        isLoading = true
        errorMessage = nil
        
        do {
            let detail = try await service.fetchRaceDetail(
                season: season,
                round: round
            )
            
            self.raceDetail = detail
            self.results = detail.results
        } catch {
            self.errorMessage = "Race detail data could not be loaded."
        }
        
        isLoading = false
    }
}
