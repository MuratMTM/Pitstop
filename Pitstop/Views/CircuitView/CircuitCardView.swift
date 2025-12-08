import SwiftUI

struct CircuitCardView: View {
    let circuit: CircuitModel
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(.systemTeal).opacity(0.18),
                            Color(.systemPurple).opacity(0.15),
                            Color(.systemBlue).opacity(0.18)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.white.opacity(0.22), lineWidth: 0.6)
                )
            
            VStack(alignment: .leading, spacing: 16) {
                
                // ÜST: İsim + Lokasyon
                VStack(alignment: .leading, spacing: 4) {
                    Text(circuit.circuitName)
                        .font(.title3.bold())
                        .foregroundColor(.black.opacity(0.8))
                    
                    HStack(spacing: 6) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.red.opacity(0.8))
                        Text("\(circuit.city), \(circuit.country)")
                            .font(.subheadline)
                            .foregroundColor(.gray.opacity(0.7))
                    }
                }
                
                // ORTA: PİST FOTOĞRAFI (tam ortada, dikdörtgen – alana sığdırılmış)
                ZStack {
                    // Hafif placeholder arka plan
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.black.opacity(0.06))
                    
                    if let urlString = circuit.imageURL,
                       let url = URL(string: urlString) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 130)
                                    .padding(8)
                            case .failure(_):
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 80)
                                    .padding(24)
                                    .foregroundColor(.gray.opacity(0.5))
                            case .empty:
                                ProgressView()
                            @unknown default:
                                Color.gray.opacity(0.3)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 14)) // Taşanı kırp
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80)
                            .padding(24)
                            .foregroundColor(.gray.opacity(0.5))
                    }
                }
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
                .shadow(radius: 4, y: 2)
                
                Divider().background(Color.white.opacity(0.15))
                
                // ALT 1: İstatistikler
                VStack(alignment: .leading, spacing: 10) {
                    statRow(icon: "timer",
                            title: "Lap Record",
                            value: circuit.lapRecord ?? "—")
                    
                    statRow(icon: "ruler",
                            title: "Length",
                            value: "\(circuit.circuitLength ?? 0) m")
                    
                    statRow(icon: "arrow.triangle.turn.up.right.circle",
                            title: "Corners",
                            value: "\(circuit.numberOfCorners ?? 0)")
                    
                    statRow(icon: "calendar",
                            title: "First Hosted",
                            value: "\(circuit.firstParticipationYear ?? 0)")
                }
                
                Divider().background(Color.white.opacity(0.15))
                
                // ALT 2: En hızlı tur bilgisi
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 6) {
                        Text("FASTEST LAP")
                            .font(.caption2.bold())
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(Color.black.opacity(0.18))
                            .cornerRadius(6)
                        
                        HStack {
                            Text("\(circuit.fastestLapDriverId?.uppercased() ?? "—") | \(circuit.fastestLapTeamId?.uppercased() ?? "—") |")
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.8))
                            
                            Text("\(circuit.fastestLapYear ?? 2025)")
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.8))
                        }
                    }
                    .padding(.top, 6)
                }
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func statRow(icon: String, title: String, value: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black.opacity(0.8))
            
            Text(title)
                .foregroundColor(.black.opacity(0.8))
                .font(.caption)
            
            Spacer()
            
            Text(value)
                .foregroundColor(.black.opacity(0.8))
                .font(.caption.bold())
        }
    }
    
    private func capsule(text: String, color: Color) -> some View {
        Text(text)
            .font(.caption2.bold())
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(color.opacity(0.85))
            )
    }
}


#Preview {
    CircuitCardView(circuit: CircuitViewModel().circuits.first!)
}
