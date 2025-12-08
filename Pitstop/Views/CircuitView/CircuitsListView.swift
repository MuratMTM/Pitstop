import SwiftUI

struct CircuitListView: View {
    @StateObject private var vm = CircuitViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading Circuits...")
                        .padding()
                }
                else if let error = vm.errorMessage {
                    VStack(spacing: 12) {
                        Text("An error occurred")
                            .font(.headline)
                        
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                        
                        Button("Retry") {
                            Task { await vm.loadCircuits() }
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                }
                else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(vm.circuits, id: \.circuitId) { circuit in
                                CircuitCardView(circuit: circuit)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Circuits")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await vm.loadCircuits()
            }
        }
    }
}

#Preview {
    CircuitListView()
}
