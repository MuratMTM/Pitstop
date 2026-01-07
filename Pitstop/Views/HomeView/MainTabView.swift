import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack(alignment: .top) {
        
            VStack(alignment: .leading, spacing: 0){
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
                    
                    RaceListView()
                        .tabItem {
                            Label("Races", systemImage: "flag.checkered")
                        }
                    CircuitListView()
                        .tabItem {
                            Label("Circuits", systemImage: "road.lanes")
                        }
                    
                }.padding(.horizontal,0)
                .accentColor(.red)
            }.ignoresSafeArea(edges: .top)
            
          
            PitstopHeaderView()
        }
    
    }
}

#Preview {
    MainTabView()
}
