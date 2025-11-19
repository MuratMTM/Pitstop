
import SwiftUI

struct CustomDriverCardView: View {

    let driver: DriverModel
    
    
    private var colors: (vibrant: Color, background: Color) {
        F1Styling.getColors(for: driver.teamId)
    }
    
    var body: some View {
       
        ZStack(alignment: .leading) {
            
     
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [colors.background.opacity(0.9), colors.background],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 180)
                .shadow(color: colors.vibrant.opacity(0.4), radius: 15, x: 0, y: 10)
            
         
            HStack(spacing: 0) {
                
               
                VStack(spacing: 8) {
                
                    Text(driver.number.description)
                        .font(.system(size: 48, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                  
                    Rectangle()
                        .fill(colors.vibrant)
                        .frame(width: 60, height: 4)
                        .cornerRadius(2)
                }
                .padding(.leading, 20)
                
               
                VStack(alignment: .leading, spacing: 5) {
                    
                    Spacer()
                    
                    Text(driver.name + driver.surname)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .shadow(radius: 2)

                    Text(driver.teamId)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(colors.vibrant)
                        .padding(.bottom, 10)
                    
                   
                    HStack(spacing: 15) {
                        StatPill(label: "PTS", value: driver.number.description, color: colors.vibrant)
                        StatPill(label: "WDC", value: driver.number.description, color: colors.vibrant)
                    }
                    
                    Spacer()
                }
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, alignment: .leading)

                
              
                VStack(spacing: 10) {
                    
             
                    Image(driver.url)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(colors.vibrant, lineWidth: 3))
                        .shadow(radius: 8)
                        
             
                    Image(driver.shortName)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding(.trailing, 20)
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 0)
    }
}


struct StatPill: View {
    let label: String
    let value: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 4) {
            Text(label)
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .background(color.opacity(0.8))
                .cornerRadius(6)
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}



struct CustomDriverCardView_Previews: PreviewProvider {
    static var previews: some View {
   
        CustomDriverCardView(driver: DriverViewModel().drivers[0])
            .previewLayout(.sizeThatFits)
            .padding()
        
     
        CustomDriverCardView(driver:DriverViewModel().drivers[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
