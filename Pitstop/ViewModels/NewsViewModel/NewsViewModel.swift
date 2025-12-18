import Foundation

@MainActor

final class NewsViewModel: ObservableObject{
    @Published var articles: [NewsArticleModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let service: NewsServiceProtocol
    
    init(service: NewsServiceProtocol = NewsService()) {
        self.service = service
    }
    
    func loadNews(limit: Int = 20) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedArticles = try await service.fetchNews(limit: limit)
            self.articles = fetchedArticles
            
        } catch  {
            self.errorMessage = "News could not be loaded."
        }
        isLoading = false
    }
}

