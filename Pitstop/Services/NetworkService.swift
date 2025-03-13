//
//  NetworkService.swift
//  Pitstop
//
//  Created by Murat Işık on 21.02.2025.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetcTeams() async throws -> [Team]
    func fetchDrivers() async throws -> [Driver]
    func fetchRaceCalendar() async throws -> [Race]
    func fetchNews() async throws -> [News]
}

struct NetworkService: NetworkServiceProtocol {
   
    func fetcTeams() async throws -> [Team] {
        let url = URL(string: "https://ergast.com/api/f1/current/constructors.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TeamsResponse.self, from: data)
        
        return response.teams
        
    }
    
    func fetchDrivers() async throws -> [Driver] {
        let url = URL(string: "https://ergast.com/api/f1/current/drivers.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(DriversResponse.self, from: data)
        
        return response.drivers
    }
    
    func fetchRaceCalendar() async throws -> [Race] {
        let url = URL(string: "https://ergast.com/api/f1/current.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(RaceCalendarResponse.self, from: data)
        
        return response.races
    }
    
    func fetchNews() async throws -> [News] {
        let url = URL(string: "https://newsapi.org/v2/everything?q=formula1&apiKey=YOUR_API_KEY")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(NewsResponse.self, from: data)
        
        return response.articles
    }
}

struct TeamResponse: Codable {
    let teams: [Team]
}

struct DriverResponse: Codable {
    let drivers: [Driver]
}

struct RaceResponse: Codable {
    let races: [Race]
}

struct NewsResponse: Codable {
    let news: [News]
}
