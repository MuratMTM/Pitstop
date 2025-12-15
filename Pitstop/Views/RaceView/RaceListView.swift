import SwiftUI

struct RaceListView: View {
    
    @StateObject private var viewModel = RaceViewModel()
    let text = PitstopTexts.RaceListViewTexts.self
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()
                
                if viewModel.isLoading {
                    ProgressView(text.progressViewText.rawValue)
                        .controlSize(.large)
                    
                } else if let error = viewModel.error {
                    
                    VStack(spacing: 10) {
                        Image(systemName: text.errorIconText.rawValue)
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                        
                        Text(text.loadingErrorText.rawValue)
                        
                        Text(error)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Button(text.tryAgainButtonText.rawValue) {
                            Task { await viewModel.loadAllRaceDetails() }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                } else {
                    ScrollView {
                        LazyVStack(spacing: 24) {
                            ForEach(viewModel.races, id: \.raceId) { race in
                                RaceResultCard(race: race)
                                    .onTapGesture {
                                        viewModel.selectRace(race)
                                    }
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 8)
                    }
                }
            }
            .navigationTitle(text.raceListViewTitleText.rawValue)
            
            
            .navigationDestination(item: $viewModel.selectedRace) { race in
                RaceResultListView(
                    viewModel: RaceDetailViewModel(
                        season: race.season,
                        round: race.round
                    )
                )
                .navigationTitle(race.raceName)
                .navigationBarTitleDisplayMode(.inline)
            }
            .task {
                if viewModel.races.isEmpty {
                    await viewModel.loadAllRaceDetails()
                }
            }
        }
    }
}
