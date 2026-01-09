import SwiftUI

struct RaceCardView: View {
    let race: Race

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            topBar
            title
            subtitle
            podiumRow
        }
        .padding(14)
        .background(.background, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 14, x: 0, y: 8)
    }
}

// MARK: - Pieces
private extension RaceCardView {

    var topBar: some View {
        HStack(spacing: 8) {
            Text("ROUND \(race.round)")
                .font(.caption2.weight(.semibold))
                .foregroundStyle(.secondary)

            FlagThumb(urlString: race.circuit?.flagUrl)

            Spacer()

            Text(race.schedule?.race?.time ?? "")
                .font(.caption2.weight(.semibold))
                .foregroundStyle(.secondary)
        }
    }

    var title: some View {
        Text(race.raceName.uppercased())
            .font(.system(size: 20, weight: .black, design: .rounded))
            .lineLimit(3)
            .minimumScaleFactor(0.9)
    }

    var subtitle: some View {
        Text((race.championshipId ?? "FORMULA 1").uppercased())
            .font(.caption2)
            .foregroundStyle(.secondary)
            .lineLimit(1)
    }

    var podiumRow: some View {
        HStack(alignment: .bottom, spacing: 14) {
            ForEach(podium3, id: \.position) { item in
                PodiumMini(item: item, isWinner: item.position == 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.top, 4)
    }

    var podium3: [PodiumItem] {
    
        race.podiumTop3?.sorted(by: { $0.position < $1.position }) ?? []
    }
}

// MARK: - Small components
private struct FlagThumb: View {
    let urlString: String?
    var size: CGFloat = 16

    var body: some View {
        if let urlString, let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let img): img.resizable().scaledToFill()
                default: Color.secondary.opacity(0.18)
                }
            }
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: size * 0.35, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: size * 0.35, style: .continuous)
                    .stroke(.black.opacity(0.08), lineWidth: 1)
            )
        }
    }
}

private struct PodiumMini: View {
    let item: PodiumItem
    let isWinner: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text("\(item.position)")
                    .font(.system(size: isWinner ? 22 : 20, weight: .black, design: .rounded))
                    .foregroundStyle(isWinner ? .orange : .secondary.opacity(0.6))

                Circle()
                    .fill(isWinner ? .orange.opacity(0.35) : .secondary.opacity(0.25))
                    .frame(width: 26, height: 26)
            }

            if isWinner {
                HStack(spacing: 10) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable().scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundStyle(.primary.opacity(0.85))

                    Text(driverCode)
                        .font(.system(size: 16, weight: .black, design: .rounded))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.yellow.opacity(0.22), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            } else {
                Text(driverCode)
                    .font(.system(size: 16, weight: .black, design: .rounded))
            }

            Text(item.time ?? "")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .foregroundStyle(isWinner ? .pink : .secondary)
        }
    }

    private var driverCode: String {

        item.driver?.driverId
        ?? item.driver?.shortName
        ?? "TBD"
    }
}

