import Foundation

protocol NewsServiceProtocol {
    func fetchNews(limit: Int) async throws -> [NewsArticleModel]
}

final class NewsService: NewsServiceProtocol {
    
    private let baseURL = "http://localhost:3000/api/news"
    private let networkService: NetworkService
    
    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }
    
    func fetchNews(limit: Int) async throws -> [NewsArticleModel] {
        guard let url = URL(string: "\(baseURL)?limit=\(limit)") else {
            throw NetworkError.badURL
        }
        
        let response = try await networkService.fetch(
            NewsModelResponse.self,
            from: url
        )
        
        return response.articles
    }
}

