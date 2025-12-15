import Foundation

@MainActor
class RaceViewModel: ObservableObject {
    
    @Published var races: [RaceModel] = []
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    @Published var selectedRace: RaceNavigationItem?

    
    private var service: RaceServiceProtocol
    private var imageService: ImageService
    let season: Int
    init(service: RaceServiceProtocol = RaceService(), imageService: ImageService = ImageService(), season: Int = 2025){
        self.service = service
        self.imageService = imageService
        self.season = season
    }
    
    func selectRace(_ race: RaceModel) {
        print("🟢 Selected race:", race.raceName, "round:", race.round)

        selectedRace = RaceNavigationItem(
            season: season,
            round: race.round,
            raceName: race.raceName
        )
    }

    
    func loadAllRaceDetails() async {
        isLoading = true
        error = nil
        
        do {
        
            let scheduleRaces = try await service.fetchSchedule()
            
            await withTaskGroup(of: RaceModel?.self) { group in
                
                for race in scheduleRaces {
                    group.addTask { [weak self] in
                        guard let self = self else { return nil }
                        
                     
                        let processedRace = await self.fetchAndAssignImages(for: race)
                        return processedRace
                    }
                }
                
                var fetchedRaces: [RaceModel] = []
                for await race in group {
                    if let race = race {
                        fetchedRaces.append(race)
                    }
                }
        
                self.races = fetchedRaces.sorted { $0.round < $1.round }
            }
            
        } catch {
            self.error = error.localizedDescription
        }
        
        isLoading = false
    }


    private func fetchAndAssignImages(for race: RaceModel) async -> RaceModel {
        var raceToUpdate = race
        
      
        let country = raceToUpdate.circuit.country
        
        if !country.isEmpty {
            let flagURL = await imageService.getImageURL(path: "flags/\(country).png")
            raceToUpdate.circuit.circuitFlagURL = flagURL
        }

        if let winner = raceToUpdate.winner {
            let winnerId = winner.driverId

      
            if !winnerId.isEmpty {
                let driverURL = await imageService.getImageURL(path: "drivers/\(winnerId).png")
                
                raceToUpdate.winner!.driverImageURL = driverURL
            }
        }
        
        return raceToUpdate
    }
}

