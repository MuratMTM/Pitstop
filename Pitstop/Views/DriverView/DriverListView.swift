import SwiftUI

struct DriverListView: View {
    @StateObject private var vm = DriverViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
          

                    ForEach(teamNamesInOrder, id: \.self) { teamName in
                        if let drivers = groupedDrivers[teamName] {

                            teamSectionHeader(teamName)
                                .padding(.horizontal, 20)
                                .padding(.top, 6)

                            VStack(spacing: 16) {
                                ForEach(drivers) { driver in
                                    DriverCardView(driver: driver)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 14)
                        }
                    }
                }
                .padding(.vertical, 16)
            }

            .navigationBarHidden(true)
            .task { await vm.loadDrivers() }
        }
    }
}

private extension DriverListView {
    
    var groupedDrivers: [String: [Driver]] {
        Dictionary(grouping: vm.drivers) { driver in
            driver.teamName ?? driver.driverId
        }
    }
    
    var teamNamesInOrder: [String] {
        groupedDrivers.keys.sorted { team1, team2 in
            let points1 = vm.drivers
                .filter { $0.teamName == team1 }
                .reduce(0) { $0 + $1.points }
            
            let points2 = vm.drivers
                .filter { $0.teamName == team2 }
                .reduce(0) { $0 + $1.points }
            
            return points1 > points2 
        }
    }
    
    
    func teamSectionHeader(_ teamName: String) -> some View {
        let colors = F1Styling.getColors(for: teamName)
        
        return HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 4)
                .fill(colors.vibrant)
                .frame(width: 6)
            
            Text(F1Styling.teamDisplayName(for: teamName))
                .font(.headline.weight(.semibold))
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(colors.vibrant.opacity(0.08))
        .cornerRadius(12)
        .padding(.horizontal, 12)
    }
}


