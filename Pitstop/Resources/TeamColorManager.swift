import SwiftUI

struct TeamColorManager{
    static func color(for team: String) -> Color{
        switch team {
        case "RedBull":
            return .red
        case "McLaren":
            return .orange
        case "Mercedes" :
            return .gray
        case "Ferrari" :
            return .yellow
        case "Alpine" :
            return .pink
        case "Williams" :
            return .blue
        case "Haas" :
            return .black
        case "Aston Martin" :
            return .green
        case "Racing Bulls" :
            return .white
        case "Kick Sauber" :
            return .green
        default:
            return .gray
        }
    }
}
