import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground)
                            .ignoresSafeArea()
            VStack{
                TabView {
                    NewsListView()
                        .tabItem {
                            Label("News", systemImage: "newspaper")
                        }
                    
                    GridView()
                        .tabItem {
                            Label("Grid", systemImage: "person.3")
                        }
                    
                    StandingsView()
                        .tabItem {
                            Label("Standings", systemImage: "trophy")
                        }
                    
                    CircuitListView()
                        .tabItem {
                            Label("Races", systemImage: "flag.checkered")
                        }
                }
                .accentColor(.red)
            }
            
          
            PitstopHeaderView()
        }.navigationBarHidden(true)
    
    }
}

#Preview {
    MainTabView()
}
