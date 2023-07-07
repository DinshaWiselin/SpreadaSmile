//
//  SignUpView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 27.06.23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authService : FirebaseAuthService
    @State var email : String = ""
    @State var password : String = ""
    var body: some View {
        VStack{
            Text("Please Register")
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("SignUp"){
                authService.signUp(emailAdress: email, password: password)
            }
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
