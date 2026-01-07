import SwiftUI

struct MainTabView: View {
    var body: some View {
       
        VStack(spacing: 0) {
            
        
            PitstopHeaderView()
            
          
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
            }
            .accentColor(.red)
        }
       
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    MainTabView()
}
