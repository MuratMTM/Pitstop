import Foundation

class OtherNewsItemViewModel: ObservableObject {
    @Published var otherNewsItem: [OtherNewsItem] = [
        
        OtherNewsItem(imageName: "otherNewsImage1", title: "Norris takes victory over Leclerc and Piastri in gripping Monaco Grand Prix", description: "Lando Norris expertly converted pole position into victory during Sunday’s Monaco Grand Prix, leading home Ferrari rival Charles Leclerc and McLaren team mate Oscar Piastri at the end of an intriguing, strategic race, which saw Max Verstappen hold P1 until the penultimate lap on an alternate strategy."),
        
        OtherNewsItem(imageName: "otherNewsImage2", title: "‘It’s not how we want to go racing’ – Albon rues frustrating ‘tactical game’ in Monaco", description: "Although it helped them to secure a double points finish, Williams pair Alex Albon and Carlos Sainz were left frustrated by the “messy” midfield strategy of drivers slowing down the pack to allow their team mate to claim a free pit stop in Monaco."),
        
        OtherNewsItem(imageName: "otherNewsImage3", title: "Leclerc admits he ‘lost the race’ in Qualifying but takes positives from competitive Monaco weekend", description: "Charles Leclerc was again left with mixed feelings following the Monaco Grand Prix, having been forced to settle for second position behind pole-sitting rival Lando Norris."),
        
        OtherNewsItem(imageName: "otherNewsImage4", title: "'We put everything together when it mattered' – Ocon thrilled with return to the points in Monaco", description: "After a run of tough and inconsistent weekends, Esteban Ocon became one of the drivers to benefit most under the shaken-up Monaco race format as he claimed points with Haas for the first time since the Bahrain Grand Prix."),
    ]
    


    
}
