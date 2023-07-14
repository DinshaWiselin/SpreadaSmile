//
//  GiftDetailsView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 07.07.23.
//

import SwiftUI

struct GiftDetailsView: View {
    var product:Products
    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView  {
                //            Product Image
                
                Image(product.image)
                    .resizable()
                    .aspectRatio(1,contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                DescriptionView(product:product)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("\(product.price)")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        /*.navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
         }*/
        
    }
    
    
}

struct GiftDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GiftDetailsView(product: Products.dummyProduct)
    }
}
struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
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
                    Image("star")
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
                Button(action: {}) {
                    Image(systemName: "minus")
                        .padding(.all, 8)
                    
                }
                .frame(width: 30, height: 30)
               
                .foregroundColor(.black)
                
                Text("1")
                    .font(.title2)
                                            .fontWeight(.semibold)
                                            .padding(.horizontal, 8)
                                        
                                        //                        Plus Button
                                        Button(action: {}) {
                                           
                                                  Image(systemName: "plus")
                                                .foregroundColor(.black)
                                                .padding(.all, 8)
                                                .background(Color("Primary"))
                                                .clipShape(Circle())
                                        }
                                    }
                                    
                                }
.padding()
.padding(.top)
.background(Color("Bg"))
.cornerRadius(30)
.offset(x: 0, y: -30.0)
                            }
                            
                        }
                    


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
            
                            .foregroundColor(.black)
                            .padding(.all, 12)
                            .background(Color.white)
                            .cornerRadius(8.0)
                    }
                }
            }

