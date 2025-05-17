//
//  News.swift
//  Pitstop
//
//  Created by Murat Işık on 21.02.2025.
//

import Foundation

struct News: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let url: String
    let image: String
    let date: String
    
}

