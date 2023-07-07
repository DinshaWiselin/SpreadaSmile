//
//  SpreadaSmileApp.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 22.06.23.
//

import SwiftUI
import Firebase
@main
struct SpreadaSmileApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FirebaseAuthService())
        }
    }
}
