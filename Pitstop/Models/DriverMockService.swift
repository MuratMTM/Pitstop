import Foundation

struct DriverMockData {
    static let verstappenDetail = DriverDetailModel(
        id: "1",
        baseDriver:Driver(
            id: "1",
            previewImageUrl: "verstappen_preview",
            name: "Max Verstappen",
            number: "1",
            championship: "3",
            points: "255",
            constructor: "Red Bull Racing",
            originFlag: "netherlands_flag" // Assets’teki bayrak görseli
        ),
        biography: "Max Verstappen is a Dutch racing driver who races for Red Bull Racing in Formula 1. Known for his aggressive style and dominance in recent seasons.",
        birthDate: "30 September 1997",
        grandPrixes: [
            GrandPrixResult(name: "Bahrain GP", position: "1st", points: 25),
                   GrandPrixResult(name: "Jeddah GP", position: "1st", points: 25),
                   GrandPrixResult(name: "Australian GP", position: "DNF", points: 0),
                   GrandPrixResult(name: "Japanese GP", position: "2nd", points: 18)
        ],
        lastSeasonStatistics: [
            "Total Points: 575",
            "Wins: 19",
            "Pole Positions: 12",
            "Fastest Laps: 9"
        ],
        records: [
            "Most wins in a single season: 19",
            "Most consecutive wins: 10",
            "Youngest F1 debut: 17 years and 166 days"
        ],
        driverNews: [
            "Verstappen continues dominant streak in 2025",
            "Red Bull aims to secure Constructors' title early",
            "Verstappen praises team after strategic win in Japan"
        ]
    )
}
