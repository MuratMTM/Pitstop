import Foundation
import FirebaseStorage

final class ImageService {
    private let storage = Storage.storage(url: "gs://pitstop-6cb5e.firebasestorage.app")

    func getImageURL(path: String) async -> String? {
        print("📦 Trying to fetch from Firebase path:", path)
        let ref = storage.reference().child(path)

        do {
            let url = try await ref.downloadURL()
            print("✅ Firebase URL Success →", url.absoluteString)
            return url.absoluteString
        } catch {
            print("🔥 Firebase error for [\(path)]: \(error.localizedDescription)")
            return nil
        }
    }
}
