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
    @StateObject var viewModel = ApiCallViewModel()
    @StateObject var appViewModel : AppViewModel{
        AppViewModel(apiCall: viewModel)
    }
    init(){
        let viewModel = ApiCallViewModel()
        FirebaseApp.configure()
       
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FirebaseAuthService())
                .environmentObject(appViewModel)
                .environmentObject(viewModel)
        }
    }
}
