
import SwiftUI

struct TeamStandingsListView: View {

    @StateObject var viewModel = TeamViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            PitstopHeaderView()
            StandingsHeaderView(title: "TEAM STANDINGS")
            
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(viewModel.teams.sorted(by: { $0.position < $1.position })) { team in
                        TeamStandingsCardView(team: team)
                    }
                }.padding()
                            }
        }.task {
            await viewModel.loadTeams()
        }
        .ignoresSafeArea()
    }
}

struct StandingsHeaderView: View {
    let title: String
    var body: some View {
     
            VStack {
                Text(title)
                    .font(.system(size: 24, weight: .heavy))
            }
            .foregroundColor(.white)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background(Color.black)
        
    }
}

