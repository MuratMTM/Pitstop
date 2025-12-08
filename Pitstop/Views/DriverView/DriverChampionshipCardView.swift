import SwiftUI

struct DriverChampionshipCardView: View {
    let driverChampionship: DriverChampionshipModel
    
    private var colors: (vibrant: Color, background: Color) {
        F1Styling.getColors(for: driverChampionship.teamId)
    }
    
    private var driver: ChampionshipDriver {
        driverChampionship.driver
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [colors.background, colors.vibrant],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: colors.vibrant.opacity(0.35), radius: 12, x: 0, y: 8)
                .overlay(
                    Text(driverChampionship.team.teamName)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                        .foregroundColor(.white.opacity(0.08))
                        .rotationEffect(.degrees(-18))
                        .padding(),
                    alignment: .bottomTrailing
                )
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(alignment: .center) {
                    // Position
                    Text("#\(driverChampionship.position)")
                        .font(.system(size: 28, weight: .heavy))
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        Text("\(driver.name) \(driver.surname)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(driverChampionship.team.teamName)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    // Driver Image
                    AsyncImage(url: URL(string: driverChampionship.imageURL ?? "")) { phase in
                        switch phase {
                        case .success(let img):
                            img.resizable().scaledToFill()
                        default:
                            Color.white.opacity(0.2)
                        }
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white.opacity(0.4), lineWidth: 2))
                }
                
                // Stats Row
                HStack(spacing: 12) {
                    statView(title: "PTS", value: "\(driverChampionship.points)")
                    statView(title: "WINS", value: "\(driverChampionship.wins)")
                    
                    Spacer()
                    
                    // Flag
                    AsyncImage(url: URL(string: driverChampionship.flagURL ?? "")) { phase in
                        switch phase {
                        case .success(let img):
                            img.resizable().scaledToFit()
                        default:
                            Color.white.opacity(0.2)
                        }
                    }
                    .frame(width: 32, height: 22)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
    
    private func statView(title: String, value: String) -> some View {
        Text("\(title) \(value)")
            .font(.caption.bold())
            .padding(.vertical, 4)
            .padding(.horizontal, 10)
            .background(.white.opacity(0.9))
            .foregroundColor(.black)
            .cornerRadius(6)
    }
}

#Preview {
    DriverChampionshipCardView(driverChampionship: DriverChampionshipViewModel().driverChampionship.first!)
}
