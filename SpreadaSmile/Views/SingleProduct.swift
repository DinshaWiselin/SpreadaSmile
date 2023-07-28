//
//  SingleProduct.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 03.07.23.
//

import SwiftUI
struct SingleProduct: View {
    var product:Product
    var body: some View {
        HStack(alignment:.center){
            VStack{
                Text(product.category)
                    .font(.title)
                    .bold()
                   .frame(width: 220,height: 80)
                //Text("\(\(Double(format: "%.2f", product.price)))")
                    .frame(width: 220,height: 80)
            }.padding()
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
           .clipShape(Rectangle())
            
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
        SingleProduct(product:Product.dummyProduct)
    }
}

