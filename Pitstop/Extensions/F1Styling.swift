
import Foundation
import SwiftUI


struct F1Styling {
    
    static let teamColors: [String: (vibrant: Color, background: Color)] = [
        "Red Bull Racing": (
            vibrant: Color(red: 0.89, green: 0.04, blue: 0.07),
            background: Color(red: 0.0, green: 0.0, blue: 0.2)
        ),
        "McLaren": (
            vibrant: Color(red: 1.0, green: 0.45, blue: 0.0),
            background: Color(red: 0.03, green: 0.1, blue: 0.25)
        ),
        "Mercedes": (
            vibrant: Color(red: 0.0, green: 0.8, blue: 0.7),
            background: Color(red: 0.2, green: 0.2, blue: 0.25)
        ),
        "Ferrari": (
            vibrant: Color(red: 0.89, green: 0.0, blue: 0.0),
            background: Color(red: 0.15, green: 0.0, blue: 0.0)
        ),
        "Aston Martin": (
            vibrant: Color(red: 0.0, green: 0.4, blue: 0.35),
            background: Color(red: 0.1, green: 0.1, blue: 0.1)
        ),
        "Alpine": (
            vibrant: Color(red: 0.8, green: 0.3, blue: 0.7),
            background: Color(red: 0.05, green: 0.1, blue: 0.5)
        ),
        "Williams": (
            vibrant: Color(red: 0.0, green: 0.7, blue: 1.0),
            background: Color(red: 0.0, green: 0.0, blue: 0.15)
        ),
        "Racing Bulls": ( // Visa Cash App RB F1 Team
            vibrant: Color(red: 0.3, green: 0.6, blue: 1.0),
            background: Color(red: 0.0, green: 0.0, blue: 0.3)
                        ),
        "Kick Sauber": ( // Stake F1 Team Kick Sauber
            vibrant: Color(red: 0.35, green: 1.0, blue: 0.0),
            background: Color(red: 0.05, green: 0.1, blue: 0.1)
                       ),
        "Haas": (
            vibrant: Color(red: 0.9, green: 0.9, blue: 0.9),
            background: Color(red: 0.1, green: 0.1, blue: 0.1)
        ),
        
    ]
    
    
    static func getColors(for constructor: String) -> (vibrant: Color, background: Color) {
        return teamColors[constructor] ?? (vibrant: .gray, background: .black.opacity(0.8))
    }
}
