
import Foundation

enum CountryCodeMapper {
    
    static func code(for nationality: String) -> String {
        let normalized = nationality.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch normalized {
        case "great britain":
            return "gb"
        case "united kingdom":
            return "gb"
        case "england":
            return "gb"
        
        case "netherlands":
            return "nl"
        case "the netherlands":
            return "nl"
        
        case "spain":
            return "es"
        
        case "france":
            return "fr"
        
        case "italy":
            return "it"
        
        case "germany":
            return "de"
        
        case "brazil":
            return "br"
        
        case "argentina":
            return "ar"
        
        case "canada":
            return "ca"
        
        case "united states":
            return "us"
        
        case "japan":
            return "jp"
        
        case "australia":
            return "au"
        
        case "switzerland":
            return "ch"
        
        case "thailand":
            return "th"
        
        case "monaco":
            return "mc"
        
        case "new zealand":
            return "nz"
        
        default:
            print("⚠️ UYARI: Eşleşmeyen nationality → \(nationality)")
            return "xx"  // hata ayıklama için
        }
    }
}
