import SwiftUI

struct DriverListView: View {
    @StateObject private var vm  = DriverViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16, pinnedViews: []) {
                    
                    ForEach(vm.drivers, id: \.driverId) { driver in
                        DriverCardView(driver: driver)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 16)
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Drivers")
            .navigationBarTitleDisplayMode(.large)
            .task { await vm.loadDrivers() }
        }
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
