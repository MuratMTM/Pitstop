

import SwiftUI

struct TeamCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                .fill(Color.secondary)
                .frame(width: 330, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 5)
                )
                            
            HStack{
                VStack(alignment: .leading){
                    Text("Ferrari")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.horizontal, 80)
                        
                }
                
                VStack{
                    Image("ferrari")
                        .resizable()
                        .frame(width: 40, height: 55)
                        .cornerRadius(10)
                    
                    Image("italy")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.vertical,10)
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    TeamCardView()
}
