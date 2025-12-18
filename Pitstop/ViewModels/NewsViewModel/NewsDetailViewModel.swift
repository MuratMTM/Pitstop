import Foundation

@MainActor

final class NewsDetailViewModel: ObservableObject{
    
    private let article: NewsArticleModel
    
    init(article: NewsArticleModel) {
        self.article = article
    }
    
    var title: String {
        article.title
    }
    
    var summary: String {
        article.summary
    }
    
    var imageURL: URL? {
        guard let image = article.image else { return nil }
        return URL(string: image)
    }
    
    
    var sourceText: String {
        article.source
    }
    var formattedDate: String {
        article.publishedAt.prettyNewsDate
    }
    var articleURL: URL? {
        URL(string: article.url)
    }
}
