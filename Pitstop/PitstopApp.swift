

import SwiftUI
import Firebase

@main
struct PitstopApp: App {
 
    init() {
           FirebaseApp.configure()
           print("🔥 Firebase Configured")
       }

    var body: some Scene {
        WindowGroup {
            RaceListView()
        }
    }
}
