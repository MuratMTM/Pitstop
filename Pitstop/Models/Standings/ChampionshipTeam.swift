

import Foundation

struct ChampionshipTeam: Decodable {
    let teamId: String
    let teamName: String
    let country: String
    let firstAppareance: Int
    let constructorsChampionships: Int?
    let driversChampionships: Int?
    let url: String
}
