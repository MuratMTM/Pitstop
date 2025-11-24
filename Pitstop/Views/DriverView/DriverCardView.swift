import SwiftUI

struct DriverCardView: View {
    let driver: DriverModel
    
    private var colors: (vibrant: Color, background: Color) {
        F1Styling.getColors(for: driver.teamId)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
         
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [colors.background, colors.vibrant],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: colors.vibrant.opacity(0.45), radius: 16, x: 0, y: 10)
                .overlay(
                    
                    Text(F1Styling.teamShortCode(for: driver.teamId))
                        .font(.system(size: 72, weight: .black, design: .rounded))
                        .foregroundColor(.white.opacity(0.07))
                        .rotationEffect(.degrees(-18))
                        .offset(x: 20, y: 40),
                    alignment: .bottomTrailing
                )
       
            VStack(spacing: 14) {
                
           
                HStack {
                    Text(F1Styling.teamDisplayName(for: driver.teamId).uppercased())
                        .font(.caption2.weight(.semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(colors.vibrant.opacity(0.85))
                        )
                    Spacer()
                }
                
           
                VStack(spacing: 6) {
                    Text("#\(driver.number)")
                        .font(.system(size: 34, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("\(driver.name) \(driver.surname)")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    
                    Text(driver.shortName)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
                
                Divider()
                    .overlay(Color.white.opacity(0.35))
                    .padding(.vertical, 4)
                
             
                HStack {
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Nationality")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.65))
                        
                        Text(driver.nationality)
                            .font(.callout.weight(.semibold))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 3) {
                        Text("Birthday")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.65))
                        
                        Text(driver.birthday)
                            .font(.callout.weight(.semibold))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(18)
        }
        .onTapGesture {
            if let url = URL(string: driver.url) {
                UIApplication.shared.open(url)
            }
        }
    }
}


#Preview {
    DriverCardView(driver: DriverModel(
        driverId: "norris",
        name: "Lando",
        surname: "Norris",
        nationality: "Great Britain",
        birthday: "13/11/1999",
        number: 4,
        shortName: "NOR",
        url: "https://en.wikipedia.org/wiki/Lando_Norris",
        teamId: "mclaren"
    ))
    .padding()
}
