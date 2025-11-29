import SwiftUI

struct DriverChampionshipListView: View {
    
    @StateObject private var viewModel = DriverChampionshipViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Yükleniyor…")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                else if let error = viewModel.errorMessage {
                    VStack(spacing: 10) {
                        Text("Bir hata oluştu")
                            .foregroundColor(.red)
                        Text(error)
                            .foregroundColor(.white.opacity(0.7))
                        
                        Button("Tekrar Dene") {
                            Task { await viewModel.loadDriverChampionship() }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 24) {
                            ForEach(viewModel.driverChampionship) { item in
                                DriverChampionshipCardView(driverChampionship: item)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationTitle("Driver Standing 2025")
            .navigationBarTitleDisplayMode(.large)
            .background(Color.black.ignoresSafeArea())
            .task {
                await viewModel.loadDriverChampionship()
            }
        }
    }
}


#Preview {
    DriverChampionshipListView()
}
