import SwiftUI

struct RaceCardView: View {
    let race: Race
    let onTap: () -> Void
    let text = PitstopTexts.RacecCardViewTexts.self
    
    private var raceSponsorYearText: String {
        let yearPart = race.schedule?.race?.date
            .map { String($0.prefix(4)) } ?? text.year.rawValue

        let name = race.raceName ?? "Yarış Adı Yok"
        return "\(text.sponsor.rawValue) \(name.uppercased()) \(yearPart)"
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
        
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text("ROUND \(race.round ?? 0)")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        if let flagUrl = race.circuit?.flagUrl, let url = URL(string: flagUrl) {
                            AsyncImage(url: url) { image in
                                image.resizable().scaledToFit().frame(height: 24)
                            } placeholder: {
                                EmptyView()
                            }
                        }
                    }
                    .foregroundStyle(.gray)
                    
                    Text((race.raceName ?? "Yarış Adı Yok").uppercased())
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .minimumScaleFactor(0.9)
                        .multilineTextAlignment(.leading)
                    
                    Text(raceSponsorYearText)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Text(race.schedule?.race?.time ?? "")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal)
            
            Divider()
            
           
            podiumSection
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 6)
        .onTapGesture {
                    onTap()  
                }
    }
    
    private var podiumSection: some View {
        VStack(alignment: .leading, spacing: 12) {
     
            
            HStack(spacing: 12) {
                ForEach(topThree, id: \.position) { item in
                    VStack(spacing: 8) {
                        Text("\(item.position ?? 0)")
                            .font(.title2.bold())
                            .frame(width: 50, height: 50)
                            .background(podiumColor(for: item.position ?? 0))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                        
                        Text(item.driver?.shortName ?? "—")
                            .font(.headline)
                            .lineLimit(1)
                        
                        Text(item.time ?? "—")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal)
       
    }
    
    private var topThree: [PodiumItem] {
        race.podiumTop3?.sorted { ($0.position ?? 999) < ($1.position ?? 999) } ?? []
    }
    
    private func podiumColor(for position: Int) -> Color {
        switch position {
        case 1: return .yellow
        case 2: return .gray
        case 3: return .orange.opacity(0.8)
        default: return .gray.opacity(0.5)
        }
    }
}
