//
//  GiftDetailsView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 07.07.23.
//

import SwiftUI

struct GiftDetailsView: View {
    @EnvironmentObject var appViewModel : AppViewModel
   // var shopName :ProductCategories
    var product:Products
    @State var numberofproducts = 0
    var body: some View {
        
        NavigationStack{
            ScrollView  {
                VStack{
                    //            Product Image
                    Image(product.image)
                        .resizable()
                        .frame(width:210 ,height: 200)
                        //.scaledToFit()
                        //.aspectRatio(1,contentMode: .fit)
                        //.edgesIgnoringSafeArea(.top)
                        .cornerRadius(20.0)
                    DescriptionView(product:product)
                   
                   /* Text("\(product.price)")
                        .font(.title)
                        .foregroundColor(.white)*/
                }
                // .edgesIgnoringSafeArea(.top)
                HStack {
                   
                   /* Text("\(product.price)")
                        .font(.title)
                        .foregroundColor(.white)*/
                   
                   // Spacer()
                    VStack{
                        
                        /* Button(action:appViewModel.addToCart(product: product)){
                         Label("Add to Cart")
                         .font(.title3)
                         .fontWeight(.semibold)
                         .foregroundColor(.black)
                         .padding()
                         .padding(.horizontal, 8)
                         .background(Color.purple)
                         .cornerRadius(10.0)
                         }*/
                        Button("Add to Cart") {
                            appViewModel.addToCart(product: product)
                        }.font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding()
                            .padding(.horizontal, 8)
                            .background(Color.purple)
                            .cornerRadius(10.0)
                        
                        Button("Buy Now") {
                            // PaymentButtonView()
                        } .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding()
                            .padding(.horizontal, 8)
                            .background(Color.purple)
                            .cornerRadius(10.0)
                        
                        /*  Text("Add to Cart")
                         .font(.title3)
                         .fontWeight(.semibold)
                         .foregroundColor(.black)
                         .padding()
                         .padding(.horizontal, 8)
                         .background(Color.purple)
                         .cornerRadius(10.0)
                         
                         Text("Buy Now")
                         .font(.title3)
                         .fontWeight(.semibold)
                         .foregroundColor(.black)
                         .padding()
                         .padding(.horizontal, 8)
                         .background(Color.purple)
                         .cornerRadius(10.0)*/
                        
                    }
                }
                .padding()
                .padding(.horizontal)
                // .background(Color("Primary"))
                .cornerRadius(60.0)
                //.frame(maxHeight: .infinity, alignment: .bottom)
                .edgesIgnoringSafeArea(.bottom)
               
            }
            .navigationTitle("Your Gift")
            .toolbar {
               /* Image(systemName: "heart.fill")
                    .foregroundColor(.purple)*/
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
struct GiftDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GiftDetailsView(product: Products.dummyProduct)
            .environmentObject(AppViewModel())
    }
}


struct DescriptionView: View {
    @EnvironmentObject var appViewModel : AppViewModel
    var product:Products
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text(product.category)
                .font(.title)
                .fontWeight(.bold)
            //                Rating
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(product.description)
                .lineSpacing(8.0)
                .opacity(0.6)
                            
   //                Info
            HStack {
                //                        Minus Button
                Button(action: {
                   var myProduct = appViewModel.products.first(where : {$0.id == product.id})
                        
                    myProduct?.decrement()
                    
                }) {
                    Image(systemName: "minus")
                        
                        
                        .padding(.all, 8)
                       
                        
                    }
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
                Text("\(product.numberOfProducts)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                                        
 //                        Plus Button
                Button(action: {
                    var myProduct = appViewModel.products.first(where : {$0.id == product.id})
                         
                    myProduct?.increment()
                    
                }) {
                                           
                  Image(systemName: "plus")
                     .foregroundColor(.black)
                     .padding(.all, 8)
                     
                                        }
                Spacer()
                Text("\(product.price)")
                    .font(.title)
                    .foregroundColor(.white)
                                    }
                        }
        .padding()
        //.padding(.top)
        .background(.purple)
        .cornerRadius(30)
        .offset(x: 0, y: -30.0)
                            }
                            
                        }
                    




