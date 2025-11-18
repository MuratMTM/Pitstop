import Foundation

class NewsDetailItemViewModel: ObservableObject {
    
    @Published var mockNews:[ NewsDetailItem]  = [
        NewsDetailItem(
            title: "Leclerc clash in opening Monaco GP practice",
            subtitle: "Stroll hit with grid penalty after Leclerc clash in opening Monaco GP practice",
            body: "Monaco GP'de ilk antrenman seansında Leclerc ve Stroll arasında yaşanan olaylar, F1 dünyasında büyük yankı uyandırdı. Hakemler, olayı detaylı bir şekilde incelemeye aldı...",
            imageUrl: "car.top.door.sliding",
            date: "23 May 2025",
            source: "Formula 1",
            relatedDrivers: ["Charles Leclerc", "Lance Stroll"],
            type: .carousel
        ),
        NewsDetailItem(
            title: "Max Verstappen Takes Victory in Imola",
            subtitle: "Verstappen dominates the race weekend from pole to flag.",
            body: "Imola'da Red Bull pilotu Max Verstappen, kusursuz bir performans sergileyerek zafere ulaştı. Rakibi Perez'i geride bırakan Verstappen, şampiyonluk yolunda emin adımlarla ilerliyor.",
            imageUrl: "car.fill",
            date: "19 May 2025",
            source: "Red Bull",
            relatedDrivers: ["Max Verstappen"],
            type: .carousel
        ),
        
        // Kart Haberleri
        NewsDetailItem(
            title: "Norris takes victory over Leclerc and Piastri in gripping Monaco Grand Prix",
            subtitle: "Lando Norris expertly converted pole position into victory during Sunday's Monaco Grand Prix...",
            body: "Monaco'da Lando Norris kariyerinin en iyi yarışlarından birini çıkararak Leclerc ve Piastri'yi geride bıraktı. McLaren için çifte podyum heyecanı yaşandı.",
            imageUrl: "trophy.fill",
            date: "25 May 2025",
            source: "Sky Sports",
            relatedDrivers: ["Lando Norris", "Charles Leclerc", "Oscar Piastri"],
            type: .card
        ),
        NewsDetailItem(
            title: "'It's not how we want to go racing' – Albon rues frustrating 'tactical game' in Monaco",
            subtitle: "Although it helped them to secure a double point finish, Williams pair Alex Albon and Carlos Sainz were left frustrated by the 'm...'",
            body: "Williams pilotu Alex Albon, Monaco'daki taktiksel yarışı eleştirerek, takımın performansından memnun olmadığını belirtti.",
            imageUrl: "flag.checkered.2.crossed",
            date: "25 May 2025",
            source: "F1 TV",
            relatedDrivers: ["Alex Albon"],
            type: .card
        ),
        NewsDetailItem(
            title: "Sainz'den F1'e Çağrı: 'Bu Kuralları Değiştirin!'",
            subtitle: "Carlos Sainz, yarış sonrası F1 yönetimine sert tepki gösterdi.",
            body: "Carlos Sainz, Monaco'da yaşanan olayların ardından güvenlik kurallarının acilen gözden geçirilmesi gerektiğini söyledi.",
            imageUrl: "bolt.horizontal.fill",
            date: "26 May 2025",
            source: "AS",
            relatedDrivers: ["Carlos Sainz"],
            type: .card
        )
    ]
        
        
  
    
}
