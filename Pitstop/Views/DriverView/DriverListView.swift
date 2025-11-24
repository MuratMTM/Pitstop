import SwiftUI

struct DriverListView: View {
    @StateObject private var vm = DriverViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 24, pinnedViews: []) {
                    
                    headerView
                    
                    ForEach(teamIdsInOrder, id: \.self) { teamId in
                        if let drivers = groupedDrivers[teamId] {
                            
                    
                            teamSectionHeader(teamId)
                            
                            VStack(spacing: 16) {
                                ForEach(drivers, id: \.driverId) { driver in
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
    
    var groupedDrivers: [String: [DriverModel]] {
        Dictionary(grouping: vm.drivers, by: { $0.teamId })
    }
    
    var teamIdsInOrder: [String] {
        groupedDrivers.keys
            .sorted { lhs, rhs in
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
    
    func teamSectionHeader(_ teamId: String) -> some View {
            let colors = F1Styling.getColors(for: teamId)
            
            return HStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(colors.vibrant)
                    .frame(width: 6)
                
                Text(F1Styling.teamDisplayName(for: teamId))
                    .font(.headline.weight(.semibold))
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(
                colors.vibrant.opacity(0.08)  
            )
            .cornerRadius(12)
            .padding(.horizontal, 12)
        }
    
    func teamHeader(teamId: String) -> some View {
        let colors = F1Styling.getColors(for: teamId)
        
        return HStack(spacing: 10) {
            Circle()
                .fill(colors.vibrant)
                .frame(width: 10, height: 10)
            
            Text(F1Styling.teamDisplayName(for: teamId))
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .padding(.bottom, 4)
        .background(
            Color(.systemGroupedBackground)
                .opacity(0.98)
        )
    }
}


    #Preview {
        
        DriverListView()
        
    }

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //struct CustomDriverListView: View {
        //
        //    @StateObject private var vm  = DriverViewModel()
        //
        //    var body: some View {
        //        NavigationStack {
        //
        //            Color(UIColor.systemGray6)
        //                .edgesIgnoringSafeArea(.all)
        //                .overlay(
        //                    ScrollView {
        //
        //                        LazyVStack(spacing: 25) {
        //                            ForEach(vm.drivers, id: \.driverId) { driver in
        //
        //                                NavigationLink(destination: Text("Pilot Detay Sayfası \(driver.name)")) {
        //                                    CustomDriverCardView(driver: driver)
        //                                }
        //
        //                                .buttonStyle(PlainButtonStyle())
        //                            }
        //                        }
        //                        .padding(.top, 20)
        //                        .padding(.horizontal)
        //                    }
        //                )
        //
        //
        //            .navigationTitle("F1 PİLOTLARI")
        //
        //            .navigationBarTitleDisplayMode(.large)
        //
        //            .toolbarBackground(.visible, for: .navigationBar)
        //
        //            .preferredColorScheme(.light)
        //        }
        //    }
        //}
        //
        //#Preview {
        //    CustomDriverListView()
        //}
