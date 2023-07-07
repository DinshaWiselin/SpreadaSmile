//
//  SignInView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 27.06.23.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authService : FirebaseAuthService
    @State var email : String = ""
    @State var password : String = ""
    var body: some View {
        VStack{
            Image("Frame 1")
            Text("Login")
                .font(.largeTitle)
                
            Text("Please Sign in to Continue")
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $password)
            Button("SignIn"){
                authService.signIn(emailAdress: email, password: password)
            }
            Text("Don't have an account?")
            Button("SignUp"){
                authService.signUp(emailAdress: email, password: password)
            }
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(FirebaseAuthService())
    }
}
