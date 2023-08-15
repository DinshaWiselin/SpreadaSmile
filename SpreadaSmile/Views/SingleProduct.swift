//
//  SingleProduct.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 03.07.23.
//

import SwiftUI
struct SingleProduct: View {
    @State var product:Product
    
    @EnvironmentObject var viewModel : ApiCallViewModel
    var body: some View {
        
        HStack{
           // Spacer()
            VStack{
               
                Text(product.category)
                    .font(.headline)
                    //.bold()
                   .frame(width: 200,height: 20)
                   .foregroundColor(.white)
                  // .padding(.leading,30)
              Text("$\(String(format: " %.2f", product.price))")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200,height: 20)
                   // .padding(.bottom,60)
                Button(action: {
                    if product.isFavorite == nil{
                        product.isFavorite = false
                    }
                    product.isFavorite?.toggle()
                    print(product.isFavorite)
                                        //  Update saved favourites
                    viewModel.updateFavorites()
                }) {
                    if product.isFavorite ?? false {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow).padding()
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray).padding()
                    }
                    
                }.buttonStyle(.borderless)
                
            }.padding(.leading,30)
            //.padding()
            AsyncImage(url: URL(string:product.image)) { phase in
                 switch phase{
                 case .empty:
                 ProgressView()
                 case .success(let resultImage):
                 resultImage
                         
                 .resizable()
                 .frame(width: 140, height: 140)
                 //.scaledToFit()
                 .aspectRatio(contentMode: .fit)
                 .cornerRadius(10)
                 .padding(.trailing,65)
                 case .failure(_):
                 Image("Sweets")
                 @unknown default:
                 Text("FAIL")
                 }
                 }
         //  .clipShape(Rectangle())
            
                 //.overlay(alignment: .bottomTrailing) {
               /*  Text(article.source.name)
                 .font(.title)
                 .foregroundColor(.white)
                 }*/
              
               // Divider()
            }
        
        .frame(width:350 ,height: 150)
        .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal,10)
        }
    //}
}

struct SingleProduct_Previews: PreviewProvider {
    static var previews: some View {
        SingleProduct(product:Product.dummyProduct)
            .environmentObject(ApiCallViewModel())
    }
}

