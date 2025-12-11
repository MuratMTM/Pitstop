import Foundation

@MainActor
class RaceViewModel: ObservableObject {
    
    // Yayımlanacak Ana Veri: Tüm zenginleştirilmiş yarışların listesi
    @Published var races: [RaceModel] = []
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    
    private var service: RaceServiceProtocol
    private var imageService: ImageService
    
    init(service: RaceServiceProtocol = RaceService(), imageService: ImageService = ImageService()){
        self.service = service
        self.imageService = imageService
    }
    
    // MARK: - Tüm Yarışları Çekme Fonksiyonu
    
    func loadAllRaceDetails() async {
        isLoading = true
        error = nil
        
        do {
            // 1. AŞAMA: Tüm takvimi çek, round numaralarını al.
            let scheduleRaces = try await service.fetchSchedule()
            
            // 2. AŞAMA: Her round için DETAYLI sonuçları ve 2 görseli PARALEL ÇEKME
            await withTaskGroup(of: RaceModel?.self) { mainGroup in
                
                for race in scheduleRaces {
                    let roundNumber = race.round
                    
                    mainGroup.addTask { [self] in
                        do {
                            // a. Detaylı sonuçları çek (Results dizisi buraya gelir)
                            var raceWithResults = try await service.fetchRace(for: roundNumber)
                            
                            // b. SADECE 2 GÖRSELİ (Bayrak + Kazanan) paralel çekme ve atama
                            raceWithResults = await self.fetchAndAssignWinnerImages(for: raceWithResults)
                            
                            return raceWithResults
                            
                        } catch {
                            print("Error fetching race \(roundNumber): \(error.localizedDescription)")
                            // Hata durumunda, en azından temel takvim verisini döndürelim (görsel/sonuçsuz)
                            return race
                        }
                    }
                }
                
                // 3. AŞAMA: Sonuçları topla, sırala ve yayımla
                var fetchedRaces: [RaceModel] = []
                for await race in mainGroup {
                    if let race = race {
                        fetchedRaces.append(race)
                    }
                }
                
                fetchedRaces.sort { $0.round < $1.round }
                self.races = fetchedRaces
            }
            
        } catch {
            self.error = error.localizedDescription
            print("Main Schedule Fetch Error: \(error)")
        }
        
        isLoading = false
    }
    
    private func fetchAndAssignWinnerImages(for race: RaceModel) async -> RaceModel {
        var raceToUpdate = race
        
       
        let countryName = raceToUpdate.circuit.country
        
       
        let winnerDriverId: String? = raceToUpdate.results.first(where: { $0.position == 1 })?.driver.driverId
      
        async let flagURL = self.imageService.getImageURL(path: "flags/\(countryName).png")
        
        async let winnerImageURL: String? = {
            guard let id = winnerDriverId else { return nil }
            return await self.imageService.getImageURL(path: "drivers/\(id).png")
        }()
        
        raceToUpdate.circuit.circuitFlagURL = await flagURL
        
        if let winnerURL = await winnerImageURL, let winnerIndex = raceToUpdate.results.firstIndex(where: { $0.position == 1 }) {
            raceToUpdate.results[winnerIndex].driverImageURL = winnerURL
        }
        
        return raceToUpdate
    }
}
