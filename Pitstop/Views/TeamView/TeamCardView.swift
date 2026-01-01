import SwiftUI

struct TeamCard: View {
    let team: Team
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
        
            LinearGradient(
                colors: [
                    Color(hex: team.teamColor ?? "#333333"),
                    Color(hex: team.teamColor ?? "#333333").opacity(0.85),
                    Color(hex: team.teamColor ?? "#333333").opacity(0.6)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 16) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(team.teamName)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .lineLimit(2)
                        
                       
                        HStack(spacing: 24) {
                            HStack(spacing: 8) {
                                Image(systemName: "trophy.fill")
                                    .font(.title2)
                                Text("\(team.constructorsChampionships)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            
                            HStack(spacing: 8) {
                                Image(systemName: "medal.fill")
                                    .font(.title2)
                                Text("\(team.driversChampionships)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                        }
                        .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                
                    if let logoUrl = team.teamLogoUrl, let url = URL(string: logoUrl) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .empty, .failure:
                                Image(systemName: "shield.fill")
                                    .font(.system(size: 50))
                                    .foregroundStyle(.white.opacity(0.6))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 60, height: 60)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                Spacer()
                
            
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
                                .frame(height: 120)
                        case .failure:
                            Image(systemName: "car.fill")
                                .font(.system(size: 70))
                                .foregroundStyle(.white.opacity(0.5))
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 16)
                }
                
         
                HStack(spacing: 10) {
                    if let flagUrl = team.flagUrl, let url = URL(string: flagUrl) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .empty, .failure:
                                Circle().fill(.gray.opacity(0.4))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 28, height: 28)
                        .clipShape(Circle())
                    }
                    
                    Text(team.teamNationality ?? "Unknown")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.white.opacity(0.95))
                }
                .padding(.leading, 20)
                .padding(.bottom, 16)
            }
        }
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 6)
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
    }
}
