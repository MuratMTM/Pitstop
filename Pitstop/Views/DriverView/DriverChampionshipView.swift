import SwiftUI

struct DriverChampionshipCardView: View {
    let driverChampionship: DriverChampionshipModel
    
    var body: some View {
        
        // Tek sürücü (API her kayıtta 1 driver veriyor)
        let driver = driverChampionship.driver.first
        
        // Takım renkleri
        let colors = F1Styling.getColors(for: driverChampionship.teamId)
        
        HStack(spacing: 16) {
            
            // SOL DİKEY RENK ÇUBUĞU
            RoundedRectangle(cornerRadius: 3)
                .fill(colors.vibrant)
                .frame(width: 6)
            
            VStack(alignment: .leading, spacing: 8) {
                
                // ÜST SATIR: SIRA + İSİM + FOTO
                HStack(alignment: .top) {
                    
                    // Şampiyonadaki sırası
                    Text("\(driverChampionship.position)")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.white.opacity(0.9))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(driver?.name ?? "") \(driver?.surname ?? "")")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(F1Styling.teamDisplayName(for: driverChampionship.teamId))
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    // PİLOT FOTO (Firebase’den dolduracağın yer)
                    AsyncImage(
                        url: URL(string: driverChampionship.imageURL ?? "")
                        // veya: driver?.photoURL ?? ""
                    ) { phase in
                        switch phase {
                        case .success(let img):
                            img.resizable().scaledToFill()
                        default:
                            Color.white.opacity(0.2)
                        }
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(colors.vibrant, lineWidth: 3)
                    )
                }
                
                // ALT SATIR: PTS + WINS + FLAG
                HStack {
                    
                    Text("PTS \(driverChampionship.points)")
                        .font(.caption.bold())
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(colors.vibrant)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                    
                    Text("WINS \(driverChampionship.wins)")
                        .font(.caption.bold())
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(colors.vibrant)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                    
                    Spacer()
                    
                    // ÜLKE BAYRAĞI (istersen sonra Firebase flagURL ile doldur)
                    AsyncImage(
                        url: URL(string: driver?.flagURL ?? "")
                    ) { phase in
                        switch phase {
                        case .success(let img):
                            img.resizable().scaledToFill()
                        default:
                            Color.white.opacity(0.3)
                        }
                    }
                    .frame(width: 28, height: 18)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
        .padding()
        .background(
            LinearGradient(
                colors: [colors.vibrant, colors.background],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(22)
        .shadow(color: colors.vibrant.opacity(0.3), radius: 8, y: 4)
    }
}

#Preview {
    let mockDriver = DriverModel(
        driverId: "norris",
        name: "Lando",
        surname: "Norris",
        nationality: "Great Britain",
        birthday: "1999-11-13",
        number: 4,
        shortName: "NOR",
        url: "",
        teamId: "mclaren",
        photoURL: nil,
        flagURL: nil
    )
    
    let mockChamp = DriverChampionshipModel(
        classificationId: 1,
        driverId: "norris",
        teamId: "mclaren",
        points: 115,
        position: 2,
        wins: 1,
        driver: [mockDriver],
        teams: [],
        imageURL: nil
    )
    
    DriverChampionshipCardView(driverChampionship: mockChamp)
        .padding()
        .background(Color.black)
}
