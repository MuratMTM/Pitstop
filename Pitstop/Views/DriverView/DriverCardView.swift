
import SwiftUI

struct DriverCardView: View {
    let driver: Driver

    private var colors: (vibrant: Color, background: Color) {
        F1Styling.getColors(for: driver.teamName ?? driver.driverId)
    }

    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: 24, style: .continuous)

        ZStack(alignment: .topLeading) {

            cardShape
                .fill(
                    Color(hex: driver.teamColor ?? "#333333")
                )
                .shadow(
                    color: Color(hex: driver.teamColor ?? "#333333").opacity(0.45),
                    radius: 16,
                    x: 0,
                    y: 10
                )
                .overlay(
                    Text(F1Styling.teamShortCode(for: driver.teamName ?? driver.driverId))
                        .font(.system(size: 72, weight: .black, design: .rounded))
                        .foregroundColor(.white.opacity(0.08)) 
                        .rotationEffect(.degrees(-18))
                        .offset(x: 20, y: 40),
                    alignment: .bottomTrailing
                )

            VStack(spacing: 14) {

             
                HStack {
                    Text(F1Styling.teamDisplayName(for: driver.teamName ?? driver.driverId).uppercased())
                        .font(.caption2.weight(.semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(colors.background.opacity(0.85)))
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .minimumScaleFactor(0.85)
                        .shadow(radius: 20)

                    Spacer()
                }

               
                HStack(alignment: .center, spacing: 16) {

                    VStack(alignment: .center, spacing: 6) {
                        Text("#\(driver.number ?? 0)")
                            .font(.system(size: 34, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)

                        Text(driver.fullName)
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.85)

                        Text(driver.shortName ?? "")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                            .lineLimit(1)
                    }

                    Spacer(minLength: 0)

                    driverImageView
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Divider()
                    .overlay(Color.white.opacity(0.35))

           
                HStack(alignment: .top) {

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Nationality")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.65))

                        HStack(spacing: 10) {
                            flagView

                            Text(driver.nationality)
                                .font(.callout.weight(.semibold))
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.85)
                        }
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 6) {
                        Text("Birthday")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.65))

                        Text(driver.birthday?.formattedBirthday ?? "Unknown")
                            .font(.callout.weight(.semibold))
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.9)
                    }
                }
            }
            .padding(18)
        }
        .clipShape(cardShape)
        .contentShape(cardShape)
        .frame(maxWidth: .infinity)
        .frame(minHeight: 230)
        .onTapGesture {
            if let urlString = driver.url, let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
    }

    // MARK: - Subviews

    private var driverImageView: some View {
        Group {
            if let imageUrl = driver.imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .empty:
                        ProgressView().tint(.white)
                    case .failure:
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(.white.opacity(0.7))
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
        .frame(width: 140, height: 140)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(colors.vibrant, lineWidth: 3)
        )
        .shadow(radius: 8)
        .padding(.trailing, 6)
    }

    private var flagView: some View {
        Group {
            if let flagUrl = driver.flagUrl, let url = URL(string: flagUrl) {
                AsyncImage(url: url) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Circle().fill(.gray.opacity(0.4))
                }
            } else {
                Circle().fill(.gray.opacity(0.4))
            }
        }
        .frame(width: 24, height: 24)
        .clipShape(Circle())
    }
}
