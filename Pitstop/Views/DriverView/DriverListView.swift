import SwiftUI

struct DriverListView: View {
    @StateObject private var vm = DriverViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 24, pinnedViews: []) {
                    headerView
                    
                    ForEach(teamNamesInOrder, id: \.self) { teamName in
                        if let drivers = groupedDrivers[teamName] {
                            teamSectionHeader(teamName)
                            
                            VStack(spacing: 16) {
                                ForEach(drivers) { driver in
                                    DriverCardView(driver: driver)
                                        .padding(.horizontal, 18)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 32)
            }
            .background(Color(.systemGroupedBackground))
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
        groupedDrivers.keys.sorted { lhs, rhs in
            F1Styling.teamDisplayName(for: lhs) < F1Styling.teamDisplayName(for: rhs)
        }
    }
    
    var headerView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Formula 1")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("2025 Drivers")
                .font(.largeTitle.bold())
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 10)
        .padding(.horizontal, 20)
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
