//
//  CircuitModel.swift
//  Pitstop
//
//  Created by Murat Işık on 18.11.2025.
//

import Foundation


struct CircuitModel: Decodable {
    let circuitId: String
    let circuitName: String
    let country: String
    let city: String
    let circuitLength: Int
    let lapRecord: String
    let firstParticipationYear: Int
    let numberOfCorners: Int
    let fastestLapDriverId: String
    let fastestLapTeamId: String
    let fastestLapYear: String
    let url: String
    }

