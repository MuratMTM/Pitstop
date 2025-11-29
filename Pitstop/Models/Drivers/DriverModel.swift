//
//  Driver.swift
//  Pitstop
//
//  Created by Murat Işık on 21.02.2025.
//

import Foundation

struct DriverModel: Decodable, Identifiable {
    var id: String { driverId }
    
    let driverId: String
    let name: String
    let surname: String
    let nationality: String
    let birthday: String
    let number: Int
    let shortName: String
    let url: String
    let teamId: String
    
    // App-internal fields
    var imageURL: String?
    var flagURL: String?
}

struct DriverResponse: Decodable {
    let limit: Int
    let offset: Int
    let total: Int
    let season: Int
    let championshipId: String
    let drivers: [DriverModel]
}
