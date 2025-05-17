
import SwiftUI

struct CustomDriverListView: View {
    @StateObject private var viewModel = CustomDriverCardViewModel(customDriversViewModel: customDrivers)
    var body: some View {
        NavigationStack {
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.7), .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.customDriversViewModel) { driver in
                            CustomDriverCardView( driverNumber: driver.number,
                                                  driverName: driver.name,
                                                  constructor: driver.constructor,
                                                  image: driver.previewImageUrl,
                                                  points: driver.points,
                                                  wdc: driver.championship,
                                                  driverOrigin: driver.originFlag
                                                  
                            ) }
                    }
                }.navigationTitle("Drivers")
                    .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
}

#Preview {
    CustomDriverListView()
}
