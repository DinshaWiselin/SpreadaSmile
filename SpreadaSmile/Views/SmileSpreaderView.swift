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
    @EnvironmentObject var appViewModel : AppViewModel
    @State var random : Int = 0
    var body: some View {
        NavigationStack{
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
               /* VStack {
                           HStack {
                               Spacer()
                               Text(viewModel.products[self.random].category)
                                   .background(Color.white)
                               Spacer()
                               Button("Next image") {
                                   self.random = Int.random(in: 0..<3)
                               }
                               Spacer()
                           }

                    Image(viewModel.products[self.random].image)
                           .resizable()
                           .scaledToFit()
                       }*/
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
            .toolbar {
                NavigationLink {
                    ShoppingCartView()
                        .environmentObject(appViewModel)
                } label: {
                    CartButton(numberOfProducts: appViewModel.products.count)
                }
            }
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
