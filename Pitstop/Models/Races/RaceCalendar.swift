//
//  Race.swift
//  Pitstop
//
//  Created by Murat Işık on 21.02.2025.
//

import Foundation

struct RaceCalendar: Identifiable, Codable {
    let id: String
    let grandPrix: String
    let location: String
    let trackImageName: String
    let date: String
    let whoWon: String
    let qualification: [String]
    let history: String
    
}
