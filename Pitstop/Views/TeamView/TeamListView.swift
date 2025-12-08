import SwiftUI

struct TeamListView: View {
    @StateObject private var vm = TeamViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBackground.ignoresSafeArea()
                
                if vm.isLoading {
                    ProgressView()
                } else if let error = vm.errorMessage {
                    VStack(spacing: 8) {
                        Text("An error occurred")
                            .font(.headline)
                        Text(error)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                        Button("Try again") {
                            Task { await vm.loadTeams() }
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(vm.teams) { team in
                                TeamCardView(team: team)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 16)
                        .padding(.bottom, 32)
                    }
                }
            }
            .navigationTitle("Teams")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await vm.loadTeams()
            }
        }
    }
}


#Preview {
    TeamListView()
}
