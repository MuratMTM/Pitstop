import SwiftUI

struct RaceListView: View {
    @StateObject private var vm = RaceViewModel()
    @State private var selectedRace: Race?
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Yarış takvimi yükleniyor...")
                        .padding()
                } else if let error = vm.errorMessage {
                    VStack(spacing: 12) {
                        Text("Bir hata oluştu")
                            .font(.headline)
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                        Button("Tekrar Dene") {
                            Task { await vm.loadRaceCalendar() }
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 14) {
                            ForEach(vm.races) { race in
                                RaceCardView(race: race) {
                                    selectedRace = race  // ← onTap closure'ı burada
                                }
                            }
                        }
                        .padding(.vertical, 20)
                    }
                }
            }
            .navigationTitle("F1 Yarış Takvimi")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await vm.loadRaceCalendar()
            }
            .navigationDestination(item: $selectedRace) { race in
                RaceDetailView(race: race)
            }
        }
    }
}
