//
//  CircuitCardView.swift
//  Pitstop
//
//  Created by Murat Işık on 24.11.2025.
//

import SwiftUI

struct CircuitCardView: View {
    let circuit: CircuitModel
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(.systemTeal).opacity(0.18),
                            Color(.systemPurple).opacity(0.15),
                            Color(.systemBlue).opacity(0.18)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.white.opacity(0.22), lineWidth: 0.6)
                )
            
            VStack(alignment: .leading, spacing: 16) {
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(circuit.circuitName)
                        .font(.title3.bold())
                        .foregroundColor(.black.opacity(0.8))
                    
                    HStack(spacing: 6) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.red.opacity(0.8))
                        Text("\(circuit.city), \(circuit.country)")
                            .font(.subheadline)
                            .foregroundColor(.gray.opacity(0.7))
                    }
                }
                
                Divider().background(Color.white.opacity(0.15))
                
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    statRow(icon: "timer",
                            title: "Lap Record",
                            value: circuit.lapRecord ?? "0")
                    
                    statRow(icon: "ruler",
                            title: "Length",
                            value: "\(circuit.circuitLength ?? 0) m")
                    
                    statRow(icon: "arrow.triangle.turn.up.right.circle",
                            title: "Corners",
                            value: "\(circuit.numberOfCorners ?? 0)")
                    
                    statRow(icon: "calendar",
                            title: "First Hosted",
                            value: "\(circuit.firstParticipationYear ?? 0)")
                }
                
                Divider().background(Color.white.opacity(0.15))
                
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(spacing: 6) {
                        Text("FASTEST LAP")
                            .font(.caption2.bold())
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(Color.black.opacity(0.18))
                            .cornerRadius(6)
                        
                        HStack{
                            Text("\(circuit.fastestLapDriverId?.uppercased() ?? "0") | \(circuit.fastestLapTeamId?.uppercased() ?? "0") |")
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.8))
                            
                            Text("\(circuit.fastestLapYear ?? 2025)")
                                .font(.caption2)
                                .foregroundColor(.black.opacity(0.8))
                        }
                    }
                    .padding(.top, 6)
                }
                
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity)
    }
    
    
    
    private func statRow(icon: String, title: String, value: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black.opacity(0.8))
            
            Text(title)
                .foregroundColor(.black.opacity(0.8))
                .font(.caption)
            
            Spacer()
            
            Text(value)
                .foregroundColor(.black.opacity(0.8))
                .font(.caption.bold())
        }
    }
    
    
    
    private func capsule(text: String, color: Color) -> some View {
        Text(text)
            .font(.caption2.bold())
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(color.opacity(0.85))
            )
    }
}

#Preview {
    CircuitCardView(circuit: CircuitViewModel().circuits.first!)
}
