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
            Image("Frame 2")
                .resizable()
               .scaledToFit()
               .frame(width:380 ,height:200 )
               .aspectRatio(contentMode: .fill)
               .padding(.top,50)
            Text("Login")
                .font(.title)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                
                
                
            Text("Please Sign in to Continue")
                .padding(.top,20)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)
                .background(.gray)
                .padding(.horizontal,30)
                .padding(.top,10)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .background(.gray)
                .padding(.horizontal,30)
           
            Button("SignIn"){
                authService.signIn(emailAdress: email, password: password)
            }
                .font(.title2)
                .frame(width: 150,height: 50)
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                .padding(.top,30)
            Spacer()
            HStack{
                Text("Don't have an account?")
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                    .padding()
                Button("SignUp"){
                    authService.signUp(emailAdress: email, password: password)
                } .font(.title3)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                    //.bold()
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
