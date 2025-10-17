import SwiftUI


extension Image {
    init(systemNameOrAsset name: String) {
        if let _ = UIImage(named: name) {
            self.init(name)
        } else {
            self.init(systemName: "photo.fill")
        }
    }
}
