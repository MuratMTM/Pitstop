

import SwiftUI

struct TeamCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .fill(Color.yellow)
                .frame(width: 330, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 3)
                    
                )
            
            
            
            VStack{
                HStack(alignment: .center ,spacing:40){
                    
                    Text("2")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                        .background(
                            Circle()
                                .fill(Color.red)
                                .frame(width: 50,height: 50))
                    
                    
                    Text("Ferrari")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .kerning(3)
                        .monospaced(true)
                    
                    
                    Image("ferrari")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    
                }
                
                
                
                HStack(spacing:30){
                    Text("127\nPTS")
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
                    
                    Image("ferrari--sf25")
                        .resizable()
                        .frame(width: 160, height: 50)
                        .cornerRadius(10)
                    
                    
                    Image("italy")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.vertical,10)
                }
            }
            
            
        }
        .frame(width: 330, height: 150)
        
        
    }
}

#Preview {
    TeamCardView()
}
