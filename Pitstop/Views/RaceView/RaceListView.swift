import SwiftUI

struct RaceListView: View {
    
    @StateObject private var viewModel = RaceViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()
                
                if viewModel.isLoading {
                    ProgressView("Yarışlar Yükleniyor...")
                        .controlSize(.large)
                } else if let error = viewModel.error {
                    VStack(spacing: 10) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                        Text("Veri Yüklenirken Hata Oluştu")
                        Text(error).font(.caption).foregroundStyle(.secondary)
                        
                        Button("Tekrar Dene") {
                            Task { await viewModel.loadAllRaceDetails() }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 24) {
                            ForEach(viewModel.races, id: \.raceId) { race in
                                RaceResultCard(race: race)
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 8)
                    }
                }
            }
            .navigationTitle("F1 Yarış Sonuçları")
            .task {
                if viewModel.races.isEmpty {
                    await viewModel.loadAllRaceDetails()
                }
            }
        }
    }
}
