import SwiftUI

struct TeamCardView: View {
    let team: TeamModel
    
    var body: some View {
        let colors = F1Styling.getColors(for: team.teamId)
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 26)
                .fill(
                    LinearGradient(
                        colors: [colors.vibrant, colors.background],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: colors.vibrant.opacity(0.35), radius: 12, y: 6)
            
            
            Text(team.teamName)
                .font(.system(size: 36, weight: .black))
                .foregroundColor(.white.opacity(0.06))
                .rotationEffect(.degrees(-18))
                .offset(x: 40, y: 28)
            
            
            if let urlString = team.imageURL,
               let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let img):
                        img.resizable()
                            .scaledToFit()
                    default:
                        Color.clear
                    }
                }
                .frame(width: 240, height: 135)
                .opacity(0.60)
                .offset(x: 100, y: 10)
            }
            
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    
                    
                    Text(team.teamName)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    
                    Text("\(team.teamNationality) • Since "+String(team.firstAppearance))
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.85))
                    
                    
                    
                    Divider()
                        .background(Color.white.opacity(0.25))
                    
                    HStack(spacing: 12) {
                        StatBadge(title: "WCC",
                                  value: team.constructorsChampionships ?? 0)
                        StatBadge(title: "WDC",
                                  value: team.driversChampionships ?? 0)
                    }
                    
                    Spacer(minLength: 0)
                }
                
                Spacer()
            }
            .padding(20)
        }
        .frame(height: 180)
    }
}

private struct StatBadge: View {
    let title: String
    let value: Int
    
    var body: some View {
        HStack(spacing: 6) {
            Text(title)
                .font(.caption2.bold())
            Text("\(value)")
                .font(.caption.bold())
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.white.opacity(0.2))
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}


