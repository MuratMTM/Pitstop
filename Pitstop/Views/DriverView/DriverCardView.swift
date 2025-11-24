//
//  DriverCardView.swift
//  Pitstop
//
//  Created by Murat Işık on 24.11.2025.
//



import SwiftUI

struct DriverCardView: View {
    let driver: DriverModel   // Senin modelinden geliyor

    var body: some View {
        let colors = F1Styling.getColors(for: driver.teamId)

        VStack(spacing: 12) {

            // Pilot Numarası
            Text("#\(driver.number)")
                .font(.system(size: 38, weight: .heavy))
                .foregroundColor(.white.opacity(0.95))
                .padding(.top, 10)

            // İsim Bilgisi
            VStack(spacing: 2) {
                Text("\(driver.name) \(driver.surname)")
                    .font(.title2.bold())
                    .foregroundColor(.white)

                Text(driver.shortName)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.75))
            }

            Divider()
                .background(Color.white.opacity(0.3))
                .padding(.horizontal, 32)

            // Alt Bilgiler (Simetrik)
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Milliyet")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.6))
                    Text(driver.nationality)
                        .font(.callout.bold())
                        .foregroundColor(.white)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 3) {
                    Text("Doğum")
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.6))
                    Text(driver.birthday)
                        .font(.callout.bold())
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)

            Spacer(minLength: 10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [
                    colors.vibrant,
                    colors.background
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(22)
        .shadow(color: colors.background.opacity(0.7), radius: 10, x: 0, y: 6)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.white.opacity(0.12), lineWidth: 1)
        )
        .onTapGesture {
            if let url = URL(string: driver.url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

#Preview {
    DriverCardView(driver: DriverModel(
        driverId: "norris",
        name: "Lando",
        surname: "Norris",
        nationality: "Great Britain",
        birthday: "13/11/1999",
        number: 4,
        shortName: "NOR",
        url: "https://en.wikipedia.org/wiki/Lando_Norris",
        teamId: "mclaren"
    ))
    .padding()
}
