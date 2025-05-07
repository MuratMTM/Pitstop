
import Foundation

struct CustomTeamCardViewModel: Identifiable {
    let id = UUID()
    let name: String
    let points: Int
    let teamLogo: String
    let carImageName: String
}
