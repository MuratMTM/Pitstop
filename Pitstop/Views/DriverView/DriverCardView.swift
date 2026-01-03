import SwiftUI

struct DriverCardView: View {
    let driver: Driver
    
    private var colors: (vibrant: Color, background: Color) {
        F1Styling.getColors(for: driver.teamName ?? driver.driverId)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(hex: driver.teamColor ?? "#333333"),
                            Color(hex: driver.teamColor ?? "#333333").opacity(0.85)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: colors.vibrant.opacity(0.45), radius: 16, x: 0, y: 10)
                .overlay(
                    Text(F1Styling.teamShortCode(for: driver.teamName ?? driver.driverId))
                        .font(.system(size: 72, weight: .black, design: .rounded))
                        .foregroundColor(.white.opacity(0.07))
                        .rotationEffect(.degrees(-18))
                        .offset(x: 20, y: 40),
                    alignment: .bottomTrailing
                )
            
            VStack(spacing: 14) {
                HStack {
                    Text(F1Styling.teamDisplayName(for: driver.teamName ?? driver.driverId).uppercased())
                        .font(.caption2.weight(.semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(colors.vibrant.opacity(0.85))
                        )
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Spacer()
                }
                
                HStack(spacing: 16){
                    VStack(spacing: 6) {
                        Text("#\(driver.number ?? 0)")
                            .font(.system(size: 34, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(driver.fullName)
                            .font(.title3.bold())
                            .foregroundColor(.white)
                        
                        Text(driver.shortName ?? "")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    if let imageUrl = driver.imageUrl,
                       let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .empty:
                                ProgressView().tint(.white)
                            case .failure:
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.system(size: 100))
                                    .foregroundStyle(.white.opacity(0.7))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 140, height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(colors.vibrant, lineWidth: 3)
                        )
                        .shadow(radius: 8)
                        .padding(.trailing, 18)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .overlay(Color.white.opacity(0.35))
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Nationality")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.65))
                        
                        HStack(spacing: 10) {
                            if let flagUrl = driver.flagUrl, let url = URL(string: flagUrl) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    Circle().fill(.gray.opacity(0.4))
                                }
                                .frame(width: 24, height: 24)
                                .clipShape(Circle())
                            }
                            
                            Text(driver.nationality)
                                .font(.callout.weight(.semibold))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 6) {
                        Text("Birthday")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.65))
                        
                        Text(driver.birthday ?? "Unknown")
                            .font(.callout.weight(.semibold))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(18)
            
 
 
        }
        .frame(height: 200)
        .onTapGesture {
            if let urlString = driver.url, let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
    }
}

