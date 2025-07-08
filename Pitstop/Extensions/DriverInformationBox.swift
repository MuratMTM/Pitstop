//
//  DriverInformationBox.swift
//  Pitstop
//
//  Created by Murat Işık on 8.07.2025.
//

import SwiftUI

struct DriverInformationBox: View {
    var boxText: String
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color.orange.opacity(0.7), Color.red.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 130, height: 80)
                .padding()
                .overlay(
                    Text(boxText)
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                )
        }
    }
}
#Preview {
    DriverInformationBox(boxText: "Doğum Tarihi\n30.09.1997")
}
