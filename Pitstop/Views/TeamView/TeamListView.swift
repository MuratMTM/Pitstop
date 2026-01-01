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
                            Spacer()
                            
                            ProgressView("Loading teams...")
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(1.5)
                                .foregroundStyle(.white)
                            
                            Spacer()
                        } else if let error = viewModel.errorMessage {
                            Spacer()
                            
                            Text(error)
                                .foregroundStyle(.red)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Spacer()
                        } else if viewModel.teams.isEmpty {
                            Spacer()
                            
                            Text("No teams available.")
                                .foregroundStyle(.secondary)
                                .font(.title2)
                            
                            Spacer()
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
