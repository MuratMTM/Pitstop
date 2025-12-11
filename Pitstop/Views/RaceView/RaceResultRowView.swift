//
//  RaceResultRowView.swift
//  Pitstop
//
//  Created by Murat Işık on 11.12.2025.
//

import SwiftUI

struct RaceResultRowView: View {
   
    let race: RaceModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            
            HStack {
                Text("ROUND \(race.round)")
                    .font(.caption)
                    .foregroundColor(.f1Red)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text(formatDate(race.date))
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
            }
            
          
            Text(race.raceName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
         
            HStack(spacing: 4) {
                Image(systemName: "flag.fill")
                    .foregroundColor(.f1Red)
                Text("\(race.circuit.circuitName), \(race.circuit.country)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Divider()
            
         
            Text("PODIUM RESULTS")
                .font(.headline)
                .fontWeight(.semibold)
            
            HStack {
               
                ForEach(race.results.prefix(3), id: \.position) { result in
                    RaceCardDriverRowView(result: result, position: result.position)
                }
            }
            
          
        }
        .padding()
        .background(Color.white)
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.12), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "MMM dd, yyyy"
            return formatter.string(from: date)
        }
        return dateString
    }
}

