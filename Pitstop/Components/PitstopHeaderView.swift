

import SwiftUI

struct PitstopHeaderView: View {
    private let pitStopHeader: String = "Pitstop"
    private let pitStopFlagHeader: String = "raceFlag"
    
    var body: some View {
        VStack(spacing: 0) {
            // Safe Area için üst dolgu (Çentiğin arkası)
            Color.red
                .frame(height: getSafeAreaTop())
            
            // Header İçeriği
            HStack(spacing: 12) {
                Text(pitStopHeader)
                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                
                Image(pitStopFlagHeader)
                    .resizable()
                    .scaledToFit() // Oranı korumak için
                    .frame(width: 36, height: 20)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60) // İçerik yüksekliği (Toplam 110 olması için ayarlanabilir)
            .background(Color.red)
            
   
        }
        .zIndex(10)
    }

    // Cihazın Safe Area değerini güvenli bir şekilde almak için fonksiyon
    private func getSafeAreaTop() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.safeAreaInsets.top ?? 0
    }
}

#Preview {
    PitstopHeaderView()
}
