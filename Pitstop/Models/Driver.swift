//
//  Driver.swift
//  Pitstop
//
//  Created by Murat Işık on 21.02.2025.
//

import Foundation

struct Driver: Identifiable, Codable {
    let id: String
    let previewImageUrl: String
    let name: String
    let number: String
    let championship: String
    let points: String
    let history: String
    
}

let redBullDrivers: [Driver] = [
    Driver(id: "1", previewImageUrl: "verstappen", name: "MAx Verstappen", number: "1", championship: "4", points: "99", history: ""),
    Driver(id: "2", previewImageUrl: "tsunoda", name: "Yuki Tsunoda", number: "22", championship: "0", points: "9", history: "")
]

