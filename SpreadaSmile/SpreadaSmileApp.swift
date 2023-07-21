// SpreadaSmileApp.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 22.06.23.
//
import SwiftUI
import Firebase
@main
struct SpreadaSmileApp: App {
  @StateObject var firebase = FirebaseAuthService()
  @StateObject var viewModel = ApiCallViewModel()
  @StateObject var appViewModel = AppViewModel()
  init(){
    FirebaseApp.configure()
  }
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(firebase)
        .environmentObject(appViewModel)
        .environmentObject(viewModel)
    }
  }
}
