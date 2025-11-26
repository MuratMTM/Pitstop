////
////  PitstopApp.swift
////  Pitstop
////
////  Created by Murat Işık on 21.02.2025.
////

import SwiftUI
import Firebase

@main
struct PitstopApp: App {
    init() {
          #if !DEBUG
          FirebaseApp.configure()
          #endif
      }
    var body: some Scene {
        WindowGroup {
            DriverListView()
        }
    }
}
