

//import SwiftUI
//
//struct TeamView: View {
//    @StateObject private var viewModel = TeamViewModel()
//    var body: some View {
//        VStack {
//            List(viewModel.teams) { team in
//                Text(team.name)
//                    .font(.headline)
//                    .foregroundColor(.primary)
//                    .padding()
//                    .background(Color.gray.opacity(0.2))
//                
//            }.task {
//                await viewModel.fetchTeams()
//            }
//        }
//    }
//}
//
//#Preview {
//    TeamView()
//}
