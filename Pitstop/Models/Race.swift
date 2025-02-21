//
//  Race.swift
//  Pitstop
//
//  Created by Murat Işık on 21.02.2025.
//

import Foundation

struct Race: Identifiable, Decodable {
    let id: String
    let grandPrix: String
    let date: String
    let whoWon: String
    let qualification: [String]
    let history: String
    
}
