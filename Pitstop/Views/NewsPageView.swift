import SwiftUI

struct NewsPageView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.red
                    .ignoresSafeArea(edges: .top)

                HStack(spacing: 12) {
                    Text("Pitstop")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        
                        

                    Image("raceFlag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 36, height: 20)
                }
            }
            .frame(height: 60)
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 0) // Boş ama safe area'ya saygı duyar
            }
            
                
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .fill(Color.gray)
                    .frame(width: .infinity, height: 200)
                    .padding()
                    
            
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: .infinity, height: 80)
                    .padding(.horizontal,50)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Hamilton's father Anthony set to take on FIA role")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .padding()
                    
                 
                }.padding()
            }
                
                
                
            
            
            
            Spacer()
        }
    }
}



#Preview {
    NewsPageView()
}
