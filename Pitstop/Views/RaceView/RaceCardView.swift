import SwiftUI

struct RaceResultCard: View {
    let race: RaceModel
    let text = PitstopTexts.RacecCardViewTexts.self
    
    private var raceSponsorYearText: String {
        let optionalYearString = race.schedule.race.date.map { String($0.prefix(4)) }
        let yearPart = optionalYearString ?? text.year.rawValue
        
        return "\(text.sponsor.rawValue) \(race.raceName.uppercased()) \(yearPart)"
    }
    
    private var winnerInitials: String {
        guard let winner = race.winner else {
            return text.defaultEmpty.rawValue
        }
        
        if !winner.shortName.isEmpty {
            return winner.shortName
        }
        
        let firstNameInitial = winner.name.prefix(1)
        let lastNameInitial = winner.surname.prefix(1)
        
        return "\(firstNameInitial)\(lastNameInitial)".uppercased()
    }
    
    private var fastLapTimeString: String {
        return race.fast_lap.fast_lap ?? text.defaultNoFastestLap.rawValue
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text("\(text.round.rawValue) \(race.round)")
                            .font(.title3)
                            .fontWeight(.bold)
                        if let flagURL = race.circuit.circuitFlagURL, let url = URL(string: flagURL) {
                            AsyncImage(url: url) { image in
                                image.resizable().scaledToFit().frame(height: 24)
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
                    
                    Text(raceSponsorYearText)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                if race.schedule.race.date != nil {
                    Text(race.schedule.race.time ?? text.defaultDate.rawValue)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
            
            
            if race.winner != nil {
                
                HStack(spacing: 8) {
                    
                    ResultBoxView(
                        position: 1,
                        initials: winnerInitials,
                        time: fastLapTimeString,
                        driverImageURL: race.winner?.driverImageURL,
                        isFastLap: true
                    )
                    
                }
                .padding(.horizontal)
                .padding(.bottom)
                
            } else {
                Text(text.progressView.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
            }
        }
        .padding(.top, 16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    
}
