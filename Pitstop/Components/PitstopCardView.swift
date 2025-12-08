import SwiftUI

struct TeamChampionshipCardView: View {
    let team: TeamModel
    
    var body: some View {
        
        let colors = F1Styling.getColors(for: team.teamId)
        
        ZStack {
            
            LinearGradient(
                colors: [colors.vibrant, colors.background],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(28)
            .shadow(color: colors.vibrant.opacity(0.35), radius: 12, y: 6)
            
            
        }
        .frame(height: 180)
    }
}




