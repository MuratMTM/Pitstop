import Foundation

struct NewsResponse: Codable {
    let count: Int
    let articles: [News]
}

struct News: Codable, Identifiable {
    let id: String  // MongoDB _id'yi String olarak al
    let title: String
    let summary: String?
    let url: String
    let imageUrl: String?
    let publishedAt: Date
    let source: String?
    
    // MongoDB'nin otomatik eklediği alanlar – hata vermesin diye ignore et
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
        
        // Zorunlu alanlar
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
        
        // Opsiyonel alanlar
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        source = try container.decodeIfPresent(String.self, forKey: .source)
        
        // MongoDB ekstra alanları (decodeIfPresent ile güvenli al)
        _id = try container.decodeIfPresent(String.self, forKey: ._id)
        __v = try container.decodeIfPresent(Int.self, forKey: .__v)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        
        // id'yi _id'den al
        id = _id ?? UUID().uuidString
        
        // publishedAt
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
