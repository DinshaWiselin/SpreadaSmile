//
//  ContentView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 22.06.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService:FirebaseAuthService
    @EnvironmentObject var appViewModel:AppViewModel
    var body: some View {
        Group{
            if authService.user != nil{
              MainView()
                    .onAppear(){
                        appViewModel.listenProducts()
                    }
            }else{
               SignInView()
                    .onAppear(){
                        appViewModel.listenProducts()
                    }
            }
        }.onAppear{
            authService.listentoAuthState()
            appViewModel.listenProducts()
        }
       // .accentColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FirebaseAuthService())
    }
}
