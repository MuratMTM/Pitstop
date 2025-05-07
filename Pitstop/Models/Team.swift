//
//  Team.swift
//  Pitstop
//
//  Created by Murat Işık on 21.02.2025.
//

import Foundation

struct Team: Identifiable, Codable {
    let id: Int
    let name: String
    let logoURL: String
    let originFlag: String
    let foundingYear: String
    let history: String
    let points: String
    let rank: String
    let carImageURL: String
    let drivers: [Driver]
    
}

extension Team {
    func toCustomCardViewModel() -> CustomTeamCardViewModel {
        return CustomTeamCardViewModel(
            name: self.name,
            points: Int(self.points) ?? 0,
            teamLogo: self.logoURL,
            carImageName: self.carImageURL
        )
    }
}

