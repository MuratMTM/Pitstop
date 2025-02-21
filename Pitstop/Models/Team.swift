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
    let logoURl: String
    let originFlag: String
    let foundingYear: String
    let history: String
    let drivers: [Driver]
    
}
