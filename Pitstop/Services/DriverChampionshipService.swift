//
//  DriverChampionshipService.swift
//  Pitstop
//
//  Created by Murat Işık on 26.11.2025.
//

import Foundation

protocol DriverChampionshipServiceProtocol {
    func fetchDriverChampionship() async throws -> [DriverChampionshipModel]
}


final class DriverChampionshipService: DriverChampionshipServiceProtocol {
    let network = NetworkService.shared
    let baseUrl = "https://f1api.dev/api/2025/drivers-championship"
    
    func fetchDriverChampionship() async throws -> [DriverChampionshipModel] {
        guard let url = URL(string: baseUrl) else {
            throw NetworkError.badURL
        }
        
        let response = try await network.fetch(DriverChampionshipResponse.self, from: url)
        return response.drivers_championship
    }
}
