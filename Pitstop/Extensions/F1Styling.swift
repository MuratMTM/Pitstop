
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
