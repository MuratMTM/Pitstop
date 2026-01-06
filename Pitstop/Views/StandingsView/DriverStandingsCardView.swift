import SwiftUI

struct DriverStandingsCardView: View {
    let driver: Driver
    

    
    var body: some View {
        ZStack(alignment: .trailing) {
            backgroundLayer
            HStack(spacing: 0) {
                leftInfoSection
                Spacer()
                rightImageSection
            }
            .padding(.horizontal, 20)
            
        }
        .padding(.horizontal)
    }
}

// MARK: - Subviews
private extension DriverStandingsCardView {
    
    var backgroundLayer: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color(hex: driver.teamColor ?? "#333333").gradient)
            .frame(height: 160)
            .shadow(color: Color(hex: driver.teamColor ?? "#333333").opacity(0.45), radius: 16, x: 0, y: 10)
    }
    
    var leftInfoSection: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("#\(driver.position ?? 0)")
                .font(.system(size: 38, weight: .black, design: .rounded))
                .italic()
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(driver.fullName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(driver.teamName ?? "F1 Driver")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            statsBadgeRow
        }
    }
    
    var statsBadgeRow: some View {
        HStack(spacing: 8) {
            StatBadge(label: "POINTS :", value: "\(driver.points)")
    
        }
        .padding(.vertical, 10)
    }
    
    var rightImageSection: some View {
        VStack(spacing: 8) {
            pilotImage
            flagImage.offset(x: 45)
        }
        .padding(.trailing, 5)
        
    }
    
    var pilotImage: some View {
        Group {
            if let imgUrl = driver.imageUrl, let url = URL(string: imgUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .empty:
                        ProgressView()
                            .tint(.white)
                    case .failure:
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(.white.opacity(0.7))
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 95, height: 95)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
    }
    
    var flagImage: some View {
        Group {
            if let flag = driver.flagUrl, let url = URL(string: flag) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .empty, .failure:
                        Rectangle().fill(Color.white.opacity(0.1))
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 30, height: 18)
                .shadow(radius: 2)
                .padding(.top,3)
            }
        }
    }
}

// MARK: - Reusable StatBadge
struct StatBadge: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text(label)
                .font(.caption)
                .fontWeight(.bold)
            Text(value)
                .font(.caption)
                .fontWeight(.black)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(8)
        .foregroundColor(.black)
    }
}

#Preview {
    DriverStandingsCardView(driver: Driver(
        driverId: "norris",
        givenName: "Lando",
        familyName: "Norris",
        fullName: "Lando Norris",
        nationality: "Great Britain",
        birthday: "13/11/1999",
        number: 4,
        shortName: "NOR",
        url: "https://en.wikipedia.org/wiki/Lando_Norris",
        teamName: "McLaren",
        points: 333,
        position: 2,
        imageUrl: "https://example.com/norris.jpg",
        teamColor: "#FF8700",
        flagUrl: "https://flagcdn.com/w64/gb.png"
    ))
    .padding()
    .background(Color.black)
}
