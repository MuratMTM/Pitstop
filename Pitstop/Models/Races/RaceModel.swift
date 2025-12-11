//
//  Race.swift
//  Pitstop
//
//  Created by Murat Işık on 21.02.2025.
//

import Foundation

struct RaceModel: Decodable {
    let round: Int
    let date: String
    let time: String
    let url: String
    let raceId: String
    let raceName: String
    let circuit: CircuitModel
    let results: [RaceResultModel]
    
}

struct RaceResultModel: Decodable {
    let position: Int
    let points: Int
    let grid: Int
    let time: String
    let fastLap: String
    let retired: String?
    let driver: DriverModel
    let team: TeamModel
}

struct RaceModelResponse: Decodable {
    let api: String
    let url: String
    let limit: Int
    let offset: Int
    let total: Int
    let season: Int
    let races: RaceModel
}
