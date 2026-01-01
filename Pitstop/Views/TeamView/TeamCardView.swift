import SwiftUI

// MARK: - Team Card
struct TeamCard: View {
    let team: Team
    
    var body: some View {
        ZStack {
           
            LinearGradient(
                colors: [
                    Color(hex: team.teamColor ?? "#333333").opacity(0.9),
                    Color(hex: team.teamColor ?? "#333333").opacity(0.4)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            HStack(spacing: 0) {
            
                VStack(alignment: .leading, spacing: 12) {
                    Text(team.teamName)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                
                    HStack(spacing: 24) {
                        HStack(spacing: 8) {
                            Text("🏆")
                                .font(.title2)
                            Text("\(team.constructorsChampionships)")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        HStack(spacing: 8) {
                            Text("🏅")
                                .font(.title2)
                            Text("\(team.driversChampionships)")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                    }
                    .foregroundStyle(.white)
       
                    if let first = team.firstAppeareance {
                        HStack(spacing: 8) {
                            Text("📅")
                                .font(.title3)
                            Text("\(first)")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.white.opacity(0.9))
                    }
                    
            
                    HStack(spacing: 10) {
                        if let flagUrl = team.flagUrl, let url = URL(string: flagUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                Circle().fill(.gray.opacity(0.3))
                            }
                            .frame(width: 30, height: 20)
                            .clipShape(Circle())
                        }
                        
                        Text(team.teamNationality ?? "Unknown")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.white.opacity(0.9))
                    }
                }
                .padding(.leading, 24)
                .padding(.vertical, 24)
                
                Spacer()
                
                if let carUrl = team.carImageUrl, let url = URL(string: carUrl) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .scaleEffect(1.2)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 160)
                        case .failure:
                            Image(systemName: "car.fill")
                                .font(.system(size: 80))
                                .foregroundStyle(.white.opacity(0.6))
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding(.trailing, 20)
                }
            }
        }
        .frame(height: 260)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 6)
    }
}
