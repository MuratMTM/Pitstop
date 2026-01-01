import Foundation

struct NewsResponse: Codable {
    let count: Int
    let articles: [News]
}

struct News: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let summary: String?
    let url: String
    let imageUrl: String?
    let publishedAt: Date
    let source: String?
    
  
    private let _id: String?
    private let __v: Int?
    private let createdAt: String?
    private let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case title, summary, url, imageUrl, publishedAt, source
        case _id, __v, createdAt, updatedAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
 
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
        
 
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        source = try container.decodeIfPresent(String.self, forKey: .source)
        

        _id = try container.decodeIfPresent(String.self, forKey: ._id)
        __v = try container.decodeIfPresent(Int.self, forKey: .__v)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        

        id = _id ?? UUID().uuidString
        
  
        let dateString = try container.decode(String.self, forKey: .publishedAt)
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = formatter.date(from: dateString) {
            publishedAt = date
        } else {
            publishedAt = Date()
        }
    }
}
