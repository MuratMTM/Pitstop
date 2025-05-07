import SwiftUI

struct CustomTeamCardView: View {
    let viewModel: CustomTeamCardViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Kartın arka plan rengini dinamik yapıyoruz
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemGray6))  // Takım rengine göre arka plan
                .shadow(radius: 5)

            HStack(spacing: 16) {
                VStack {  // Daha fazla boşluk ekledik
                    Image(viewModel.teamLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)  // Logo boyutunu biraz büyüttük

                    Image(viewModel.countryFlag)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)  // Bayrak boyutunu büyüttük
                }
                .padding(.leading, 8)  // Sağdan daha fazla boşluk

                VStack(alignment: .leading, spacing: 12) {  // Araya boşluk ekledik
                    Text(viewModel.name)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Text("\(viewModel.points) Puan")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }.padding(.horizontal,5)

                Spacer()

                Image(viewModel.carImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)  // Araba görselinin boyutunu biraz büyüttük
                    .padding(.trailing, 16)  // Sağdan boşluk ekledik
            }
            .padding(.vertical, 30)  // Üst ve alt padding artırıldı
            .padding(.horizontal)

            // Sağ üst köşede sıralama etiketi
            Text("#\(viewModel.rank)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 35, height: 35)  // Etiketin boyutunu biraz büyüttük
                .background(Circle().fill(Color.blue))
                .offset(x: -14, y: 14)  // Etiketin konumunu ayarladık
                
        }
        .frame(height: 120)  // Kartın yüksekliğini artırdık
        .padding(.horizontal)
    }
}



#Preview {
    CustomTeamCardView(viewModel: CustomTeamCardViewModel(
        name: "McLaren",
        points: 249,
        teamLogo: "mclaren",
        carImageName: "mclarenCar",
        rank: "1",
        countryFlag: "united-kingdom"
        
    ))
}

