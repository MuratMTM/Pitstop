import SwiftUI


struct CircuitListView: View {
    @StateObject private var vm = CircuitViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(vm.circuits, id: \.circuitId) { circuit in
                        CircuitCardView(circuit: circuit)
                    }
                }
                .padding()
            }
            .navigationTitle("Circuits")
            .navigationBarTitleDisplayMode(.large)
            .task { await vm.loadCircuits() }
        }
    }
}




#Preview {
    
    CircuitListView()
    
}
