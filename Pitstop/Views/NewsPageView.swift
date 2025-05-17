import SwiftUI

struct NewsPageView: View {
    var newsImage: String
    var newsTitle: String
    var authorImage: String
    var authorName: String
    var newsDate: String
   
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
            
                
            VStack{
                Image(newsImage)
                    .resizable()
                
            }.padding(.bottom,25)
                .frame(width: 400, height: 250)
                .background(Color(.white).opacity(0.1))
                .shadow(radius: 5)
                .fixedSize(horizontal: false, vertical: false)
                
                    
           
                
                VStack(alignment: .center, spacing: 6){
                    Text(newsTitle)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .padding()
                    
                        HStack(alignment: .center, spacing: 8){
                        Image(authorImage)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                        
                        Text(authorName)
                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                .foregroundColor(.gray)
                        
                            Spacer()
                            
                            Text(newsDate)
                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                .foregroundColor(.gray)
                                
                     
                    }
                 
                }.padding(.all,7)
                .frame(width: 350)
                .background(Color(.cyan).opacity(0.1))
                .shadow(radius: 5)
                .fixedSize(horizontal: false, vertical: false)
                .cornerRadius(30)
            
                
                
                
            
            
            
            Spacer()
        }
    }
}



#Preview {
    NewsPageView(newsImage: "versoNews", newsTitle: "Verstappen reveals details of Nurburgring Nordschleife test after lap record speculation", authorImage: "adrianNewey", authorName: "Adrian Newey", newsDate: "16 May 2025")
}
