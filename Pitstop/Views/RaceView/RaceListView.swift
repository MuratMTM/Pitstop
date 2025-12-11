
import SwiftUI

struct RaceListView: View {
    
    // ViewModel'den veriyi dinler.
    @StateObject private var viewModel = RaceViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading && viewModel.races.isEmpty {
                    // İlk yükleme durumunda veya veriler henüz gelmediyse
                    LoadingView(message: "F1 Takvimi Yükleniyor...")
                } else if let error = viewModel.error {
                    // Hata durumunda yeniden deneme butonu gösterilir
                    ErrorView(errorMessage: error) {
                        Task { await viewModel.loadAllRaceDetails() }
                    }
                } else {
                    // Veri başarıyla yüklendi: Asıl Liste
                    mainContent
                }
            }
            .navigationTitle("F1 Sezon Takvimi")
            // View ilk oluşturulduğunda veya göründüğünde asenkron görevi başlat
            .task {
                if viewModel.races.isEmpty {
                    await viewModel.loadAllRaceDetails()
                }
            }
        }
    }
    
    // MARK: - Main Content (Liste)
    
    private var mainContent: some View {
        List {
            ForEach(viewModel.races, id: \.raceId) { race in
                // NavigationLink, detay sayfasına çekilmiş RaceModel'i taşır.
                NavigationLink(destination: RaceDetailView(race: race)) {
                    // SRP: Kartın görsel ve sunum sorumluluğu RaceCardView'e aittir.
                    RaceCardView(race: race)
                }
                .listRowSeparator(.hidden) // Kartlar arası çizgiyi gizle
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }
        }
        .listStyle(.plain) // Liste stilini sadeleştir
    }
}
