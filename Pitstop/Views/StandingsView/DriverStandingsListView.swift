import SwiftUI

struct DriverStandingsListView: View {
    @StateObject var viewModel: DriverViewModel
    
    var body: some View {
        
        VStack(spacing:0) {
            PitstopHeaderView()
            StandingsHeaderView(title: "DRIVER STANDİNGS")
                .padding(.bottom,16)
            ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.drivers) { driver in
                    DriverStandingsCardView(driver: driver)
                        .padding(.horizontal)
                }
            }
            
        }
        .background(Color(.systemBackground))
        .navigationTitle("Driver Standings")
        .task {
            await viewModel.loadDrivers()
        }}.ignoresSafeArea()
    }
}

#Preview {
    DriverStandingsListView(viewModel: DriverViewModel())
}
