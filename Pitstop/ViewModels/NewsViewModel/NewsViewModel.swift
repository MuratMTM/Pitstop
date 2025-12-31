import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    @Published var articles: [News] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let service = NewsService.shared
    
    func loadNews() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedArticles = try await service.fetchNews()
            self.articles = fetchedArticles
        } catch {
            self.errorMessage = "Failed to load news."
            print("News fetch error:", error)
        }
        
        isLoading = false
    }
}
