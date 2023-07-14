//
//  SmileSpreaderView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 13.07.23.
//

import SwiftUI

struct SmileSpreaderView: View {
    @EnvironmentObject var authservice : FirebaseAuthService
    @StateObject var viewModel = ApiCallViewModel()
    var body: some View {
        VStack{
            HStack(alignment: .top){
                AppBarView()
            }
            
            Text("Find your best gift for your best one.")
                .font(.subheadline)
                .foregroundColor(.purple)
            Spacer()
            ZStack{
                Circle()
                    .stroke()
                    .frame(width:250 ,height: 250)
                
                    .foregroundColor(.purple)
                
            }
            Spacer()
            HStack(){
                Spacer()
                Button{
                    authservice.signOut()
                }label:{
                    Image(systemName: "figure.walk.circle.fill")
                        .font(.title)
                        .background(Color(.white))
                        .cornerRadius(10)
                        .foregroundColor(.purple)
                    Text("SignOut")
                        .foregroundColor(.purple)
                }
                
              
            }.padding(10)
        }
    }
}

struct SmileSpreaderView_Previews: PreviewProvider {
    static var previews: some View {
        SmileSpreaderView()
    }
}
struct AppBarView: View {
    var body: some View {
       
           
        HStack(){
            Button(action: {}){
                Image(systemName: "line.3.horizontal.circle.fill")
                    .font(.largeTitle)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
                    .foregroundColor(.purple)
            }
            Text("SpreadaSmile")
                .font(.largeTitle)
                .foregroundColor(.purple)
            Spacer()
        }
    }
}
