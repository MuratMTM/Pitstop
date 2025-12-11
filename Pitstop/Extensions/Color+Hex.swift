import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


extension Color {
    func isDark() -> Bool {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let brightness = (red * 299 + green * 587 + blue * 114) / 1000

        return brightness < 0.5
    }
}

extension Color {
    
    static let pitstopRed = Color(red: 0.89, green: 0.04, blue: 0.07)
    static let darkBackground = Color(UIColor.systemGray6) // Açık tema için temiz gri
    static let darkText = Color(red: 0.1, green: 0.1, blue: 0.1)
    static let lightText = Color(red: 0.5, green: 0.5, blue: 0.5)
    
    static let podiumGold = Color(red: 1.0, green: 0.84, blue: 0.0)
    static let podiumSilver = Color(red: 0.75, green: 0.75, blue: 0.75)
    static let podiumBronze = Color(red: 0.8, green: 0.5, blue: 0.2)
}


// MARK: - Renk Tanımları

extension Color {
    
    static let f1Red = Color(red: 0.89, green: 0.04, blue: 0.07)
    
    static let bodyText = Color(red: 0.2, green: 0.2, blue: 0.2)
    
    static let metaText = Color(red: 0.5, green: 0.5, blue: 0.5)
    
    static let lightBackground = Color(UIColor.systemGray6)
    
    static let teamPrimaryColors: [String: Color] = [
        "red_bull": Color(hex: "#1E41FF"),
        "mclaren": Color(hex: "#FF8000"),
        "mercedes": Color(hex: "#0D0D0D"),
        "ferrari": Color(hex: "#DC0000"),
        "aston_martin": Color(hex: "#006F62"),
        "alpine": Color(hex: "#0090FF"),
        "williams": Color(hex: "#00A3E0"),
        "rb": Color(hex: "#0033FF"),
        "sauber": Color(hex: "#00FF75"),
        "haas": Color(hex: "#181818")  
    ]

}

