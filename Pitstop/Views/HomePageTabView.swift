//
//  HomePageTabView.swift
//  Pitstop
//
//  Created by Murat Işık on 16.10.2025.
//

import SwiftUI

struct HomePageTabView: View {

   
    
    @State private var selectedTab: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            
            // Seçilen sekmeye göre içerik
            Group {
                switch selectedTab {
                case 0:
                    NewsPageView()
                case 1:
                    CustomTeamListView()
                case 2:
                    CustomDriverListView()
                case 3:
                    RaceCalendarView(calendarEvents: RaceCalendarViewModel())
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.keyboard)
            
            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
      
    }
}
#Preview {
    HomePageTabView()
}
