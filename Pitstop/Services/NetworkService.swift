
import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case decodingError
    case noData
}

final class NetworkService {
    static let shared = NetworkService()
    private let session: URLSession
    
    private init() {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 120.0
            config.timeoutIntervalForResource = 120.0
            session = URLSession(configuration: config)
        }
    
    func fetch<T: Decodable>(_ type: T.Type, from url:URL) async throws -> T {
        print("🔗 Request: \(url.absoluteString)")
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.badResponse
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch  {
            throw NetworkError.decodingError
        }
    }
}

extension URL {
    static func apiURL(endpoint: String) -> URL? {
        return URL(string: APIConstants.baseURL + endpoint)
    }
}
