
import Foundation
import SwiftUI

struct ResultBoxView: View {

    let position: Int
    let initials: String
    let time: String
    let driverImageURL: String?
    let isFastLap: Bool
    
    private let imageSize: CGFloat = 32

    var body: some View {
        let positionColor = Color.positionColor(position)
        
        VStack(spacing: 8) {
            
            HStack(alignment: .top, spacing: 4) {
                
                Text("\(position)")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(positionColor)
                
                VStack(alignment: .leading, spacing: 2) {
                    
                    if let urlString = driverImageURL, let url = URL(string: urlString) {
                        
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            Circle().fill(Color.gray.opacity(0.3))
                        }
                        .frame(width: imageSize, height: imageSize)
                        .clipShape(Circle())
                        
                    } else {
                        Color.clear
                            .frame(width: imageSize, height: imageSize)
                    }
                    
                    Image(systemName: PitstopTexts.RacecCardViewTexts.circleIcon.rawValue)
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(positionColor)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(initials)
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(time)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(isFastLap ? .purple : .primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(8)
        .background(position == 1 ? positionColor.opacity(0.15) : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: .infinity)
    }
}
