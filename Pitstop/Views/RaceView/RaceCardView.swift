
import SwiftUI

struct RaceCardView: View {
    // Sadece görüntülenecek veriyi alır (Immutable Data Input)
    let race: RaceModel
    
    // Kartta sadece kazanan pilot gösterileceği için onu hesaplayalım.
    private var winner: RaceResultModel? {
        // results opsiyonel olduğu için ? ile güvenli erişim
        race.results.first(where: { $0.position == 1 })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // Üst Bölüm: Yarış Adı ve Tur
            header
            
            // Orta Bölüm: Pist Bayrağı ve Kazanan Pilot Görseli
            HStack(spacing: 15) {
                // Bayrak ve Tarih
                circuitInfo
                
                Spacer()
                
                // Kazanan Pilot Görseli
                winnerImage
            }
            .padding(.top, 5)
        }
        .padding()
        .background(Color.white) // Light Tema
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
    
    // MARK: - Alt Bileşenler (SRP Uygulaması)
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Round \(race.round)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            Text(race.raceName)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
            
            Text("\(race.date) \(race.time)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
    
    private var circuitInfo: some View {
        VStack(alignment: .leading) {
            Text(race.circuit.circuitName)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.primary)
            
            // Bayrak görseli (CircuitModel'den çekilir)
            if let flagURL = race.circuit.circuitFlagURL {
                AsyncImageView(url: flagURL)
                    .frame(width: 60, height: 40)
                    .cornerRadius(4)
            } else {
                // Yükleniyor veya yoksa placeholder
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 40)
            }
        }
    }
    
    private var winnerImage: some View {
        VStack(alignment: .trailing) {
            if let winner = winner {
                Text("\(winner.driver.shortName) - P1")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.9, green: 0.1, blue: 0.1)) // Kırmızı vurgu
                
                if let driverURL = winner.driverImageURL {
                    AsyncImageView(url: driverURL)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 80, height: 80)
                }
            } else {
                Text("Sonuçlanmadı")
                    .font(.callout)
                    .foregroundColor(.orange)
            }
        }
    }
}
