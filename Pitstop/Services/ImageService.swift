
import Foundation
import FirebaseStorage

final class ImageService {
    private let storage = Storage.storage()

    func getImageURL(path: String) async -> String? {
        
        let ref = storage.reference().child(path)

        do {
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("🔥 Firebase error for [\(path)]: \(error.localizedDescription)")
            return nil
        }
    }
}
