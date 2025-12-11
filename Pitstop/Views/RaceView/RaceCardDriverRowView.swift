//
//  RaceCardDriverRowView.swift
//  Pitstop
//
//  Created by Murat Işık on 11.12.2025.
//

import SwiftUI

struct RaceCardDriverRowView: View {
    let result: RaceResultModel
    let position: Int
    
    private func getPositionColor(_ pos: Int) -> Color {
            switch pos {
            case 1: return .f1Red
            case 2: return .podiumSilver
            case 3: return .podiumBronze
            default: return Color(.systemGray5)
            }
        }
    var body: some View {
            VStack(spacing: 4) {
                // 1. Pozisyon Numarası ve Puan
                HStack(spacing: 4) {
                    Text("\(result.position)")
                        .font(.system(size: 14, weight: .black, design: .rounded))
                        .foregroundColor(result.position <= 3 ? .white : .primary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(getPositionColor(result.position))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    
                    Text("\(result.points) pts")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                // 2. Sürücü Kısaltması ve Zaman/Fark
                HStack(spacing: 8) {
                    Text(result.driver.shortName)
                        .font(.system(size: 18, weight: .heavy, design: .monospaced))
                        .foregroundColor(.primary)
                    
                    Text(result.time)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(result.position == 1 ? .f1Red : .secondary)
                }
            }
            .padding(10)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2) // Hafif gölge
        }
}
