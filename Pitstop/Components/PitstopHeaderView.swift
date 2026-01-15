import SwiftUI

struct PitstopHeaderView: View {
    private let pitStopHeader: String = "Pitstop"
    private let pitStopFlagHeader: String = "raceFlag"
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
               
                Color.red
                    .frame(height: geometry.safeAreaInsets.top)
                
               Spacer()
                HStack(spacing: 12) {
                    Text(pitStopHeader)
                        .font(.system(size: min(geometry.size.width * 0.08, 32), weight: .heavy, design: .rounded)) // Ekran boyutuna göre ölçekle
                        .foregroundColor(.white)
                    
                    Image(pitStopFlagHeader)
                        .resizable()
                        .scaledToFit()
                        .frame(width: min(geometry.size.width * 0.1, 36), height: min(geometry.size.width * 0.06, 20))
                }
                .frame(maxWidth: .infinity)
                .frame(height: min(geometry.size.width * 0.15, 60))
                .background(Color.red)
            }
        }
        .frame(height: 110) // Toplam header yüksekliği (dinamik)
        .background(Color.red)
        .zIndex(10)
    }
}

#Preview {
    PitstopHeaderView()
}
