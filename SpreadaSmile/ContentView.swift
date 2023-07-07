//
//  ContentView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 22.06.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService:FirebaseAuthService
   
    var body: some View {
        Group{
            if authService.user != nil{
              MainView()
            }else{
               SignInView()
            }
        }.onAppear{
            authService.listentoAuthState()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FirebaseAuthService())
    }
}
