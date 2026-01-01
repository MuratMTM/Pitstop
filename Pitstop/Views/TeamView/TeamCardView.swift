import SwiftUI

struct TeamCard: View {
    let team: Team
    
    var body: some View {
        ZStack {
            // Gradient arka plan
            LinearGradient(
                colors: [
                    Color(hex: team.teamColor ?? "#333333"),
                    Color(hex: team.teamColor ?? "#333333").opacity(0.85)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack(spacing: 0) {
               
                VStack(alignment: .leading, spacing: 14) {
                    Text(team.teamName)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                    
                   
                    HStack(spacing: 20) {
                        HStack(spacing: 8) {
                            Text("🏆")
                                .font(.title2)
                            Text("\(team.constructorsChampionships)")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        HStack(spacing: 8) {
                            Text("🏅")
                                .font(.title2)
                            Text("\(team.driversChampionships)")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
                    .foregroundStyle(.white)
                    
                
                    if let year = team.firstAppeareance {
                        HStack(spacing: 8) {
                            Text("📅")
                                .font(.title3)
                            Text(String(year))
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.white.opacity(0.9))
                    }
                    
                  
                    HStack(spacing: 12) {
                        if let flagUrl = team.flagUrl, let url = URL(string: flagUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Circle().fill(.gray.opacity(0.4))
                            }
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                        }
                        
                        Text(team.teamNationality ?? "Unknown")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.white.opacity(0.95))
                    }
                }
                .padding(.leading, 24)
                .padding(.vertical, 21)
                
                Spacer()
                
             
                VStack(spacing: 20) {
                 
                    if let logoUrl = team.teamLogoUrl, let url = URL(string: logoUrl) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .empty, .failure:
                                Image(systemName: "shield.fill")
                                    .font(.system(size: 60))
                                    .foregroundStyle(.white.opacity(0.7))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 120, height: 120)
                        .offset(x: 20, y: 18)
                    }
                    
            
                    if let carUrl = team.carImageUrl, let url = URL(string: carUrl) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .tint(.white)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Image(systemName: "car.fill")
                                    .font(.system(size: 80))
                                    .foregroundStyle(.white.opacity(0.6))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(height: 120)
                    }
                }
                .padding(.trailing, 20)
                .padding(.vertical, 24)
            }
        }
        .frame(height: 225)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 6)
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
    }
}
