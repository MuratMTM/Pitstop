import Foundation

class NewsService {
    static let shared = NewsService()
    
    private init() {}
    
    func fetchNews() async throws -> [News] {
        guard let url = URL.apiURL(endpoint: APIConstants.Endpoints.news) else {
            throw NetworkError.badURL
        }
        
        let response: NewsResponse = try await NetworkService.shared.fetch(NewsResponse.self, from: url)
        
        return response.articles.sorted { $0.publishedAt > $1.publishedAt }
    }
}
