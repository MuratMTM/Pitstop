//import Foundation
//
//class CustomTeamListViewModel: ObservableObject {
//    @Published var teams: [CustomTeamCardViewModel] = []
//
//    init() {
//        loadMockData()
//    }
//
//    private func loadMockData() {
//        let mockTeams: [Team] = [
//            Team(id: 1, name: "Red Bull", logoURL: "redBull", originFlag: "austria", foundingYear: "2005", history: "", points: "105", rank: "3", carImageURL: "rb21", drivers: []),
//            Team(id: 2, name: "Ferrari", logoURL: "ferrari", originFlag: "italy", foundingYear: "1950", history: "", points: "94", rank: "4", carImageURL: "ferrari--sf25", drivers: []),
//            Team(id: 3, name: "Mercedes", logoURL: "mercedes", originFlag: "germany", foundingYear: "2010", history: "", points: "141", rank: "2 ", carImageURL: "mercedesCar", drivers: []),
//            Team(id: 4, name: "McLaren", logoURL: "mclaren", originFlag: "united-kingdom", foundingYear: "1963", history: "", points: "246", rank: "1", carImageURL: "mclarenCar", drivers: []),
//            Team(id: 5, name: "Williams", logoURL: "williams", originFlag: "united-kingdom", foundingYear: "1977", history: "", points: "37", rank: "5", carImageURL: "williamsCar", drivers: []),
//            Team(id: 6, name: "Haas", logoURL: "haas", originFlag: "united-states", foundingYear: "2016", history: "", points: "20", rank: "6", carImageURL: "haasCar", drivers: []),
//            Team(id: 7, name: "Aston Martin", logoURL: "astonMartin", originFlag: "united-kingdom", foundingYear: "1959", history: "", points: "14", rank: "7", carImageURL: "astonMartinCar", drivers: []),
//            Team(id: 8, name: "Racing Bulls", logoURL: "rb", originFlag: "italy", foundingYear: "2006", history: "", points: "8", rank: "8", carImageURL: "rbCar", drivers: []),
//            Team(id: 9, name: "Alpine", logoURL: "alpine", originFlag: "france", foundingYear: "2021", history: "", points: "7", rank: "9", carImageURL: "alpineCar", drivers: []),
//            Team(id: 10, name: "Kick Sauber", logoURL: "kickSauber", originFlag: "switzerland", foundingYear: "1993", history: "", points: "6", rank: "10", carImageURL: "kickSauberCar", drivers: []),
//        ]
//
//        self.teams = mockTeams.map { $0.toCustomCardViewModel() }
//    }
//}
//
