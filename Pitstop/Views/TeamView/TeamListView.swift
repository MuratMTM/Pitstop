import SwiftUI

struct TeamListView: View {
    @StateObject private var viewModel = TeamViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Teams")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.top,60)
                        
                        if viewModel.isLoading {
                            ProgressView("Loading teams...")
                                .padding(.top, 40)
                        } else if let error = viewModel.errorMessage {
                            Text(error)
                                .foregroundStyle(.red)
                                .padding(.top, 40)
                        } else if viewModel.teams.isEmpty {
                            Text("No teams available.")
                                .foregroundStyle(.secondary)
                                .padding(.top, 40)
                        } else {
                            ForEach(viewModel.teams) { team in
                                TeamCard(team: team)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                    .padding(.bottom, 40)
                }
                .ignoresSafeArea(edges: .top)
                
                PitstopHeaderView()
            }
            .task {
                await viewModel.loadTeams()
            }
        }
    }
}



#Preview {
    TeamListView()
}
