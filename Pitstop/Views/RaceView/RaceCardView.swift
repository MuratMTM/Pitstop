import SwiftUI

struct RaceResultCard: View {
    let race: RaceModel
    
    private var winnerInitials: String {
        if !race.winner.shortName.isEmpty {
            return race.winner.shortName
        }
        return "\(race.winner.name.prefix(1))\(race.winner.surname.prefix(1))".uppercased()
    }
    
    private var fastLapTimeString: String {
        return race.fast_lap.fast_lap ?? "N/A"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Text("ROUND \(race.round)")
                            .font(.caption)
                            .fontWeight(.bold)
                        if let flagURL = race.circuit.circuitFlagURL, let url = URL(string: flagURL) {
                            AsyncImage(url: url) { image in
                                image.resizable().scaledToFit().frame(height: 12)
                            } placeholder: {
                                EmptyView()
                            }
                        }
                    }
                    .foregroundStyle(.gray)
                    
                    Text(race.raceName.uppercased())
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.primary)
                    
                    Text("FORMULA 1 ROLEX \(race.raceName.uppercased()) \(race.schedule.race.date?.prefix(4) ?? "2025")")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                if let date = race.schedule.race.date {
                     Text(race.schedule.race.time ?? "14 - 16 MAR")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 8) {
                
                resultBox(
                    position: 1,
                    initials: winnerInitials,
                    time: fastLapTimeString,
                    driverImageURL: race.winner.driverImageURL,
                    isFastLap: true
                )
                
                resultBox(
                    position: 2,
                    initials: "PER",
                    time: "+12.594",
                    driverImageURL: nil,
                    isFastLap: false
                )
                
                resultBox(
                    position: 3,
                    initials: "SAI",
                    time: "+16.572",
                    driverImageURL: nil,
                    isFastLap: false
                )
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .padding(.top, 16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    private func resultBox(position: Int, initials: String, time: String, driverImageURL: String?, isFastLap: Bool) -> some View {
        
        let positionColor = Color.positionColor(position)
        
        return VStack(spacing: 8) {
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
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    } else {
                        Circle().fill(Color.gray.opacity(0.3))
                            .frame(width: 32, height: 32)
                    }
                    
                    Image(systemName: "circle.fill")
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
