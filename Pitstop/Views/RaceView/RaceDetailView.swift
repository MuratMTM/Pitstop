//
//  RaceResultDetailView.swift
//  Pitstop
//
//  Created by Murat Işık on 11.12.2025.
//

import SwiftUI

struct RaceDetailView: View {
    // Tüm sonuç verisi zaten çekilmiş ve aktarılmıştır.
    let race: RaceModel
    
    var body: some View {
        VStack {
            List {
                // Liste Başlığı
                Section(header: Text("Yarış Sonuçları").font(.title2).fontWeight(.bold)) {
                    
                    // Sütun Başlıkları
                    HStack {
                        Text("Pos").fontWeight(.bold).frame(width: 40, alignment: .leading)
                        Text("Sürücü").fontWeight(.bold)
                        Spacer()
                        Text("Puan").fontWeight(.bold)
                        Text("Zaman").fontWeight(.bold).frame(width: 80, alignment: .trailing)
                    }
                    .foregroundColor(.gray)
                    
                    // Sonuçların Listelenmesi
                    ForEach(race.results, id: \.position) { result in
                        resultRow(result: result)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle(race.raceName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Alt Bileşen: Sonuç Satırı
    
    private func resultRow(result: RaceResultModel) -> some View {
        HStack {
            Text("\(result.position)")
                .frame(width: 40, alignment: .leading)
                .font(.headline)
                .foregroundColor(result.position == 1 ? .red : .primary)
            
            Text("\(result.driver.name) \(result.driver.surname)")
                .lineLimit(1)
            
            Spacer()
            
            Text("\(result.points)")
                .font(.subheadline)
                .foregroundColor(.blue)
            
            Text(result.time)
                .frame(width: 80, alignment: .trailing)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

