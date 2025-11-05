//
//  RaceCalendarView.swift
//  Pitstop
//
//  Created by Murat Işık on 16.10.2025.
//

import SwiftUI

struct RaceCalendarView: View {
  
    @StateObject var calendarEvents: RaceCalendarViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                Color.darkBackground.edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 25) {
                        
                  
                        ForEach(calendarEvents.mockCalendar) { event in
                           
                            NavigationLink(destination: Text("\(event.grandPrix) Detay Sayfası")) {
                           
                                CustomRaceCalendarCardView(event: event)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Yarış Takvimi")
            .navigationBarTitleDisplayMode(.large)
            .preferredColorScheme(.light)
        }
    }
}

#Preview {
    RaceCalendarView(calendarEvents: RaceCalendarViewModel())
}
