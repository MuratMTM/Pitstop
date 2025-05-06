

import SwiftUI

struct TeamCardView: View {
    var team: Team
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .fill(TeamColorManager.color(for: team.name))
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
                    
                    
                    Text(team.name)
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .kerning(3)
                        .monospaced(true)
                    
                    
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
        .background(TeamColorManager.color(for: team.name)) // Kart rengi dinamik
        
        
        
    }
}

#Preview {
    TeamCardView(team: Team(id: 1, name: "Red Bull Racing", logoURL: "redBull", originFlag: "austria", foundingYear: "2004", history: "Red Bull Racing, sponsorluk anlaşması gereği Oracle Red Bull Racing, kısaca Red Bull veya RBR,Avusturyalı içecek firması Red Bull'un Scuderia AlphaTauri ile birlikte sahibi olduğu ikinci Formula 1 takımıdır.Red Bull takımı 2010 sezonunda, kuruluşunun henüz altıncı yılında, Formula 1 Markalar Şampiyonluğu'na ulaşmış ve bu unvanı kazanan ilk Avusturya takımı olmuştur.", points: "105", rank: "3", carImageURL: "rb21", drivers: redBullDrivers))
}

