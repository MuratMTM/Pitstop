
import SwiftUI

struct CustomOtherNewsView: View {
    let newsItem: OtherNewsItem
    
    var body: some View {
        HStack(spacing: 12) {
            Image(newsItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: Color.blue.opacity(0.2), radius: 4, x: 0, y: 3)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(newsItem.title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(.primary)
                    .lineLimit(3)
                
                Text(newsItem.description)
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            .padding(.vertical, 10)
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, minHeight: 110)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.7))
                .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 2)
        )
        
        .padding(.bottom, 8)
    }
}


#Preview {
    CustomOtherNewsView(newsItem:OtherNewsItemViewModel().otherNewsItem[0])
}
