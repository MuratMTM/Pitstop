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
    let constructor: String
    let originFlag: String
    let history: String
    
}

let customDrivers: [Driver] = [
    Driver(id: "1", previewImageUrl: "piastri", name: "Oscar Piastri", number: "81", championship: "0", points: "131", constructor: "McLaren",originFlag: "australia", history: ""),
    
    Driver(id: "2", previewImageUrl: "norris", name: "Lando Norris", number: "22", championship: "0", points: "115",
           constructor: "McLaren",originFlag: "united-kingdom",history: ""),
    
    Driver(id: "3", previewImageUrl: "verstappen", name: "Max Verstappen", number: "1", championship: "4", points: "99",
           constructor: "Red Bull Racing",originFlag: "netherlands",history: ""),
    
    Driver(id: "4", previewImageUrl: "russell", name: "George Russell", number: "63", championship: "0", points: "93",
           constructor: "Mercedes",originFlag: "united-kingdom",history: ""),
    
    Driver(id: "5", previewImageUrl: "leclerc", name: "Charles Leclerc", number: "16", championship: "0", points: "53",
           constructor: "Ferrari",originFlag: "monaco",history: ""),
    
    Driver(id: "6", previewImageUrl: "antonelli", name: "Kimi Antonelli", number: "12", championship: "0", points: "48",
           constructor: "Mercedes",originFlag: "italy",history: ""),
    
    Driver(id: "7", previewImageUrl: "hamiltonn", name: "Lewis Hamilton", number: "44", championship: "7", points: "41",
           constructor: "Ferrari",originFlag: "united-kingdom",history: ""),
    
    Driver(id: "8", previewImageUrl: "albon", name: "Alexander Albon", number: "23", championship: "0", points: "30",
           constructor: "Williams",originFlag: "thailand",history: ""),
    
    Driver(id: "9", previewImageUrl: "ocon", name: "Esteban Ocon", number: "31", championship: "0", points: "14",
           constructor: "Haas",originFlag: "france",history: ""),
    
    Driver(id: "10", previewImageUrl: "stroll", name: "Lance Stroll", number: "18", championship: "0", points: "14",
           constructor: "Aston Martin",originFlag: "canada",history: ""),
    
    Driver(id: "11", previewImageUrl: "tsunoda", name: "Yuki Tsunoda", number: "22", championship: "0", points: "9",
           constructor: "Red Bull Racing",originFlag: "japan",history: ""),
    
    Driver(id: "12", previewImageUrl: "gasly", name: "Pierre Gasly", number: "10", championship: "0", points: "7",
           constructor: "Alpine",originFlag: "france",history: ""),
    
    Driver(id: "13", previewImageUrl: "sainz", name: "Carlos Sainz", number: "55", championship: "0", points: "7",
           constructor: "Williams",originFlag: "spain",history: ""),
    
    Driver(id: "14", previewImageUrl: "hulkenberg", name: "Nico Hulkenberg", number: "27", championship: "0", points: "6",
           constructor: "Kick Sauber",originFlag: "germany",history: ""),
    
    Driver(id: "15", previewImageUrl: "bearmen", name: "Oliver Bearmen", number: "87", championship: "0", points: "6",
           constructor: "Haas",originFlag: "united-kingdom", history: ""),
    
    Driver(id: "16", previewImageUrl: "hadjar", name: "Isack Hadjar", number: "6", championship: "0", points: "5",
           constructor: "Racing Bulls",originFlag: "france",history: ""),
    
    Driver(id: "17", previewImageUrl: "alonso", name: "Fernando Alonso", number: "14", championship: "2",
           points: "0", constructor: "Aston Martin",originFlag: "spain", history: ""),
    
    Driver(id: "18", previewImageUrl: "lawson", name: "Liam Lawson", number: "30", championship: "0", points: "0",
           constructor: "Racing Bulls",originFlag: "australia",history: ""),
    
    Driver(id: "19", previewImageUrl: "doohan", name: "Jack Doohan", number: "7", championship: "0", points: "0",
           constructor: "Alpine",originFlag: "australia",history: ""),
    
    Driver(id: "20", previewImageUrl: "bortoleto", name: "Gabriel Bortoleto", number: "5", championship: "0", points: "",
           constructor: "kick Sauber",originFlag: "brazil",history: ""),
    
]

