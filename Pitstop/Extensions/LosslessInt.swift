
import Foundation

struct LosslessInt: Decodable {
    let value: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let intValue = try? container.decode(Int.self) {
            value = intValue
        } else if let stringValue = try? container.decode(String.self),
                  let intValue = Int(stringValue) {
            value = intValue
        } else {
            value = nil
        }
    }
}
