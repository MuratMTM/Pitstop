
import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case decodingError
}

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url:URL) async throws -> T {
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
