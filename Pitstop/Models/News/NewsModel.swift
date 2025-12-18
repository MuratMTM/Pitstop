
import Foundation

struct NewsArticleModel: Identifiable, Decodable, Hashable {
    let id: String
    let title: String
    let summary: String
    let image: String?
    let source: String
    let publishedAt: String
    let url: String
}


struct NewsModelResponse: Decodable {
    let count: Int
    let articles: [NewsArticleModel]
}

