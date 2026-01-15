import SwiftUI

struct RaceDetailView: View {
    let race: Race
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                   
                    VStack(alignment: .leading, spacing: 8) {
                        Text("ROUND \(race.round ?? 0)")
                            .font(.caption.bold())
                            .foregroundColor(.secondary)
                        
                        Text(race.raceName ?? "Yarış Adı Bilinmiyor")
                            .font(.system(size: 32, weight: .black, design: .rounded))
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 16) {
                            Text(race.schedule?.race?.date ?? "Tarih Yok")
                            Text(race.schedule?.race?.time ?? "Saat Yok")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 120) // Header boşluğu
                    
                    Divider()
                    
                    if let podium = race.podiumTop3, !podium.isEmpty {
                        let sortedPodium = podium.sorted { ($0.position ?? 999) < ($1.position ?? 999) }
                        
                        HStack(spacing: 16) {
                            ForEach(sortedPodium) { item in
                                VStack(spacing: 8) {
                                    Text("\(item.position ?? 0)")
                                        .font(.title2.bold())
                                        .foregroundColor(podiumColor(for: "\(item.position ?? 0)" ))
                                    
                                    Text(item.driver?.shortName ?? "—")
                                        .font(.headline)
                                    
                                    Text(item.time ?? "—")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }       .padding(.horizontal, 24)
                    }
                 
                    }
                    
                    Divider()
                    
                
                    VStack(alignment: .leading, spacing: 16) {
                        Text("TÜM SIRALAMA")
                            .font(.title3.bold())
                            .foregroundColor(.primary)
                        
                        LazyVStack(spacing: 12) {
                            ForEach(race.results ?? [], id: \.id) { result in
                                if let pos = result.position {
                                    HStack(spacing: 16) {
                                        Text(pos)
                                            .font(.title3.bold())
                                            .frame(width: 40)
                                            .foregroundColor(podiumColor(for: pos))
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("\(result.driver?.name ?? "") \(result.driver?.surname ?? "")")
                                                .font(.headline)
                                            
                                            Text(result.team?.teamName ?? "—")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                        
                                        Spacer()
                                        
                                        Text(result.time ?? "—")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding()
                                    .background(Color(.secondarySystemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                }
              
            }.navigationTitle(race.raceName ?? "Yarış Detayı")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .top)
            
         
        }
        
    }
    
    private func podiumColor(for position: String) -> Color {
        switch position {
        case "1": return .yellow
        case "2": return .gray
        case "3": return .orange.opacity(0.8)
        default: return .secondary
        }
    }

