import Foundation
import SwiftUI



struct TeamColorManager {
    static func backgroundColor(for team: String) -> Color {
        switch team {
        case "Red Bull": return Color("#1E1E2F")
        case "Ferrari": return Color("#DC0000")
        case "Mercedes": return Color("#C0C0C0")
        case "McLaren": return Color("#FF8700")
        case "Aston Martin": return Color("#00665E")
        case "Alpine": return Color("#0090FF")
        case "Williams": return Color("")
        case "Racing Bulls": return Color("#0F1743")
        case "Haas": return Color("#7F7F7F")
        case "Kick Sauber": return Color("#00FF87")
            
        default: return .gray
        }
        
    }
    
    static func textColor(for background: Color) -> Color {
        return background.isDark() ? .white : .black
    }
}

