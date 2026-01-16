import SwiftUI

struct PitstopHeaderView: View {
    private let title = "Pitstop"
    private let flagImage = "raceFlag"

    var body: some View {
        HStack(spacing: 12) {
            Text(title)
                .font(.title2.weight(.heavy))
                    .fontDesign(.rounded)


                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.8)

            Image(flagImage)
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 20)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
        .background(Color.red)
    }
}


#Preview {
    PitstopHeaderView()
}
