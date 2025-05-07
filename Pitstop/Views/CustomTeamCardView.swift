import SwiftUI

struct CustomTeamCardView: View {
    let viewModel: CustomTeamCardViewModel

    var body: some View {
        ZStack {
            let bgColor = TeamColorManager.backgroundColor(for: viewModel.name)
            let textColor = TeamColorManager.textColor(for: bgColor)

            RoundedRectangle(cornerRadius: 15)
                .fill(bgColor)
                .frame(height: 170)
                .shadow(radius: 5)

            VStack {
                HStack(alignment: .center, spacing: 16) {
                    Text(viewModel.name.prefix(1)) // örnek olarak ilk harf
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Circle().fill(textColor.opacity(0.2)))

                    Text(viewModel.name)
                        .font(.title2)
                        .foregroundColor(textColor)
                        .fontWeight(.bold)

                    Spacer()

                    Image(viewModel.teamLogo)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                }

                HStack(spacing: 20) {
                    Text("\(viewModel.points)\nPTS")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(textColor)
                        .multilineTextAlignment(.center)

                    Image(viewModel.carImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 40)
                }

                Spacer()
            }
            .padding()
        }
        .cornerRadius(15)
    }
}



#Preview {
    CustomTeamCardView(viewModel: CustomTeamCardViewModel(
        name: "McLaren",
        points: 249,
        teamLogo: "mclaren",
        carImageName: "mclarenCar"
    ))
}

