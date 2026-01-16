

import SwiftUI

struct RootLayout<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            PitstopHeaderView()

            content
        }
        .ignoresSafeArea(edges: .top)
    }
}
