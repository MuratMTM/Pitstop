import SwiftUI

struct CustomTeamCardView: View {
    let viewModel: CustomTeamCardViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemGray6))
                .shadow(radius: 5)

            HStack(spacing: 16) {
                Image(viewModel.teamLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding()

                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.name)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Text("\(viewModel.points) Puan")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(viewModel.carImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .padding(.trailing, 8)
            }
            .padding()
        }
        .frame(height: 100)
        .padding(.horizontal)
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

