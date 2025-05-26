
import SwiftUI

struct CustomOtherNewsView: View {
    @StateObject private var viewModel = OtherNewsItemViewModel()
    var index: Int
    var body: some View {
        VStack{
            HStack(spacing: 6){
                Image(viewModel.otherNewsItem[index].imageName)
                    
                    .resizable()
                    .containerShape(RoundedRectangle(cornerSize: CGSize(width: 30, height: 30)))
                    .shadow(color: Color.blue, radius: 3)
                    .frame(width: 100, height: 100)
                    .padding()
                    
                    
                
                Spacer()
                VStack(spacing: 6){
                    Text(viewModel.otherNewsItem[index].title)
                        .font(.caption)
                        .foregroundColor(.black)
                        .bold()
                        .multilineTextAlignment(.center)
                        
                    
                    Text(viewModel.otherNewsItem[index].description)
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        
                    
                }
            }
           
        }.frame(width:350,height: 120)
            .background(Color.gray.opacity(0.1))
        .shadow(radius: 5)
        .cornerRadius(10)
        .padding(.all,10)
        
        
    }
}

#Preview {
    CustomOtherNewsView(index: 0)
}
