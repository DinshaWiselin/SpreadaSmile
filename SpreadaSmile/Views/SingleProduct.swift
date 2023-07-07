//
//  SingleProduct.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 03.07.23.
//

import SwiftUI
struct SingleProduct: View {
    var product:Products
    var body: some View {
        HStack{
            VStack{
                Text(product.category)
                    .font(.title)
                    .bold()
                    .frame(width: 220,height: 80)
                Text(product.description)
                    .frame(width: 220,height: 80)
            }
            AsyncImage(url: URL(string:product.image)) { phase in
                 switch phase{
                 case .empty:
                 ProgressView()
                 case .success(let resultImage):
                 resultImage
                 .resizable()
                 .frame(width: 150, height: 150)
                 .cornerRadius(10)
                 case .failure(_):
                 Image(systemName: "exclamationmark.transmission")
                 @unknown default:
                 Text("FAIL")
                 }
                 }
                 //.overlay(alignment: .bottomTrailing) {
               /*  Text(article.source.name)
                 .font(.title)
                 .foregroundColor(.white)
                 }*/
              
               // Divider()
            }
            
        
        }
    //}
}

struct SingleProduct_Previews: PreviewProvider {
    static var previews: some View {
        SingleProduct(product: Products.dummyProduct)
    }
}

