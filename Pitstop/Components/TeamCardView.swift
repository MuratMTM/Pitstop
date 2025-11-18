

import SwiftUI

struct TeamCardView: View {
    var team: Team
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .fill(TeamColorManager.backgroundColor(for: team.name))
                .frame(width: 330, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 3)
                    
                )
            
            
            
            VStack{
                HStack(alignment: .center ,spacing:40){
                    
                    Text(team.rank)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                        .background(
                            Circle()
                                .fill(Color.red)
                                .frame(width: 50,height: 50))
                    
                    
                    if #available(iOS 16.0, *) {
                        Text(team.name)
                            .font(.title)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .kerning(3)
                            .monospaced(true)
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    
                    if let url = URL(string: team.logoURL){
                        AsyncImage(url: url){
                            image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                }
                
                
                
                HStack(spacing:30){
                    Text("1\(team.points)\nPTS")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                    
                        .background(
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(width: 50, height: 40)
                                .shadow(color:.red,radius:5)
                            
                        )
                    
                    if let carImageURL = URL(string: team.carImageURL) {
                        AsyncImage(url: carImageURL) {
                            image in
                            image
                                .resizable()
                                .frame(width: 160, height: 40)
                                .cornerRadius(10)
                            
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    
                    if let originFlagURL = URL(string: team.originFlag) {
                        AsyncImage(url: originFlagURL) {
                            image in
                            image
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.vertical, 10)
                            
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
            
            
        }
        .frame(width: 330, height: 150)
        .background(TeamColorManager.backgroundColor(for: team.name)) // Kart rengi dinamik
        
        
        
    }
}

//#Preview {
//    TeamCardView()
//}

