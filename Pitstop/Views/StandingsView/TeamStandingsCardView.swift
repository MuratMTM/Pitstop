import SwiftUI

struct TeamStandingsCardView: View {
    let team: Team
    
    var body: some View {
        HStack(spacing: 0) {
        
            Text("\(team.position)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 50, height: 80)
                .background(Color.black.opacity(0.8))
            
   
            HStack {
           
                if let logoUrl = team.teamLogoUrl, let url = URL(string: logoUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.white.opacity(0.2)
                    }
                    .frame(width: 60, height: 40)
                    .padding(.leading, 10)
                }
                
     
                Text(team.teamName.uppercased())
                    .font(.system(size: 22, weight: .black))
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                
                Spacer()
        
                Text("\(team.points)")
                    .font(.system(size: 24, weight: .black, design: .monospaced))
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.red.opacity(0.9))
            }
            .background(Color(hex: team.teamColor ?? "#333333"))
        }
        .frame(height: 90)
        .cornerRadius(45)
        .padding(.horizontal,3)
    }
}
