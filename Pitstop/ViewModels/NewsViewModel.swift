import Foundation

class NewsViewModel: ObservableObject{
    @Published var news: [News] = []
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()){
        self.networkService = networkService
        
    }
    
    @MainActor
    func fetchNews() async  {
        do {
            let fetchedNews = try await networkService.fetchNews()
            news = fetchedNews
        } catch  {
            print("Error fetching news: \(error)")
        }
    }
}
