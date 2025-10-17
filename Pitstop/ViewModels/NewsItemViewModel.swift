import Foundation

class NewsItemViewModel: ObservableObject {
    @Published var newsItems:[ NewsItem]  = []
    @Published var selectedIndex: Int = 0
    

    init () {
        loadNewsItems()
    }
    
    
    func loadNewsItems() {
        newsItems = [
           NewsItem(imageName: "newsItem1", title: "Stroll hit with grid penalty after Leclerc clash in opening Monaco GP practice", authorImage: "F1-logo", authorName: "Formula 1", date: "23 May 2025"),
           
           NewsItem(imageName: "newsItem2", title: "F1 EXPLAINS: The Magic of Monaco – with Mika Hakkinen and Alex Jacques", authorImage: "F1-logo", authorName: "Formula 1", date: "23 May 2025"),
           
           NewsItem(imageName: "newsItem3", title: "FP1: Leclerc leads Verstappen and Norris in first Monaco GP practice after early collision with Stroll", authorImage: "F1-logo", authorName: "Formula 1", date: "23 May 2025"),
           
           NewsItem(imageName: "newsItem6", title: "Piastri warns of ‘unpredictable’ McLaren ahead of Monaco as Norris concedes Imola showed ‘we're vulnerable in certain areas’", authorImage: "F1-logo", authorName: "Formula 1", date: "23 May 2025"),
           
           NewsItem(imageName: "newsItem4", title: "FIA Thursday press conference – Monaco", authorImage: "F1-logo", authorName: "Formula 1", date: "23 May 2025"),
           
           NewsItem(imageName: "newsItem5", title: "Hamilton ‘buzzing’ for first Monaco weekend with Ferrari after taking positives from Imola charge", authorImage: "F1-logo", authorName: "Formula 1", date: "23 May 2025"),
           ]
    }
    
}
