
import Foundation
import SwiftUI


struct F1Styling {
    
    static let teamColors: [String: (vibrant: Color, background: Color)] = [
        
     
        "red_bull": (
            vibrant: Color(hex: "#1E41FF"),
            background: Color(hex: "#6A7BFF")
        ),
        
        
        "mclaren": (
            vibrant: Color(hex: "#FF8000"),
            background: Color(hex: "#FFC085")
        ),
        
       
        "mercedes": (
            vibrant: Color(hex: "#00D2BE"),
            background: Color(hex: "#5FF7E8")),
        
       
        "ferrari": (
            vibrant: Color(hex: "#DC0000"),
            background: Color(hex: "#FF5A5A")
        ),
        
    
        "aston_martin": (
            vibrant: Color(hex: "#006F62"),
            background: Color(hex: "#4CC5B5")
        ),
        
        
        "alpine": (
            vibrant: Color(hex: "#0090FF"),
            background: Color(hex: "#66C3FF")
        ),
        
       
        "williams": (
            vibrant: Color(hex: "#00A3E0"),
            background: Color(hex: "#7FD7FF")
        ),
        
  
        "rb": (
            vibrant: Color(hex: "#0033FF"),
            background: Color(hex: "#6378FF")
        ),
        
     
        "sauber": (
            vibrant: Color(hex: "#00FF75"),
            background: Color(hex: "#80FFB7")),
        
       
        "haas": (
            vibrant: Color(hex: "#181818"),      
            background: Color(hex: "#6A6A6A")
        )
    ]
    
    static func getColors(for constructor: String) -> (vibrant: Color, background: Color) {
        teamColors[constructor] ?? (
            vibrant: .gray,
            background: .black.opacity(0.85)
        )
    }
}

extension F1Styling {
    
    static func teamDisplayName(for teamId: String) -> String {
        switch teamId {
        case "red_bull":      return "Oracle Red Bull Racing"
        case "mclaren":       return "McLaren F1 Team"
        case "mercedes":      return "Mercedes-AMG Petronas"
        case "ferrari":       return "Scuderia Ferrari"
        case "aston_martin":  return "Aston Martin Aramco"
        case "alpine":        return "BWT Alpine F1 Team"
        case "williams":      return "Williams Racing"
        case "rb":            return "Visa Cash App RB"
        case "sauber":        return "Stake F1 Team Sauber"
        case "haas":          return "Haas F1 Team"
        default:
            return teamId
                .replacingOccurrences(of: "_", with: " ")
                .capitalized
        }
    }
    
    static func teamShortCode(for teamId: String) -> String {
        switch teamId {
        case "red_bull":      return "RBR"
        case "mclaren":       return "MCL"
        case "mercedes":      return "MER"
        case "ferrari":       return "FER"
        case "aston_martin":  return "AMR"
        case "alpine":        return "ALP"
        case "williams":      return "WIL"
        case "rb":            return "RB"
        case "sauber":        return "SAU"
        case "haas":          return "HAA"
        default:              return teamId.prefix(3).uppercased()
        }
    }
}

