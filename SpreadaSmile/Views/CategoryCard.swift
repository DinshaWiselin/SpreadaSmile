//
//  CategoryCard.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 12.07.23.
//

import SwiftUI

struct CategoryCard: View {
   
       // @EnvironmentObject var cartManager: CartManager
        var productCategory: ProductCategories
        
        var body: some View {
            ZStack(alignment: .topTrailing) {
                VStack{
                  
                    Image(productCategory.image)
                        .resizable()
                       // .scaledToFill()
                        //.aspectRatio(contentMode: .fill)
                       // .clipShape(Circle())
                        .cornerRadius(20)
                        .frame(width: 180)
                       // .scaledToFit()
                        .clipped()
                    
                    VStack{
                        Text(productCategory.name)
                            .bold()
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                      /*  Text("\(product.price)$")
                            .font(.caption)*/
                    }
                    .padding()
                    .frame(width: 180,height: 40, alignment: .center)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    
                }
                .frame(width: 180, height: 250)
                .shadow(color:/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/,radius: 3)
                
               /* Button {
                    cartManager.addToCart(product: product)
                } label: {
                    Image(systemName: "plus")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(50)
                        .padding()
                }*/
            }
        }
    }
   

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
       CategoryCard(productCategory: ProductCategories(name: "Flowers", image: "Flower red"))
    }
}
