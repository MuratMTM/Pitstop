
import SwiftUI

enum Header {
    static let contentHeight: CGFloat = 56
    static let height: CGFloat = UIApplication.shared.safeAreaTop + contentHeight
}

extension UIApplication {
    var safeAreaTop: CGFloat {
        connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top }
            .first ?? 44
    }
}


