import SwiftUI

struct GridView: View {
    @State private var selectedSegment: Segment = .drivers
    
    enum Segment: String, CaseIterable {
        case drivers = "Drivers"
        case teams = "Teams"
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Color.clear
                    .frame(height: 75)
                
                Picker("Selection", selection: $selectedSegment) {
                    ForEach(Segment.allCases, id: \.self) { segment in
                        Text(segment.rawValue).tag(segment)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 20)
                .padding(.vertical,15)
                 
                if selectedSegment == .drivers {
                    DriverListView()
                } else {
                    TeamListView()
                }
            }
            PitstopHeaderView()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    GridView()
}
