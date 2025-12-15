import Foundation

struct PitstopTexts {
    
    enum RaceListViewTexts: String {
        case progressViewText = "Races are loading..."
        case loadingErrorText = "An error occurred while uploading data"
        case errorIconText = "exclamationmark.triangle.fill"
        case tryAgainButtonText = "Try again"
        case raceListViewTitleText = "F1 Race Results"
    }
    
    enum RacecCardViewTexts: String {
        case defaultEmpty = ""
        case defaultNoFastestLap = "N/A"
        case round = "ROUND"
        case sponsor = "FORMULA 1 ROLEX"
        case year = "2025"
        case defaultDate = "14 - 16 MAR"
        case progressView = "Race results are awaited..."
        case circleIcon = "circle.fill"
        
    }
}
