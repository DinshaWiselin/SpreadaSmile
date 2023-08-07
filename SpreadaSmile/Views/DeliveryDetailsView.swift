//
//  DeliveryDetailsView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 07.07.23.
//

import SwiftUI

struct DeliveryDetailsView: View {
   // var shopName :ProductCategories
    @EnvironmentObject var appViewModel : AppViewModel
    @Binding var name : String
    @Binding var street :String
    @Binding var houseNo :String
    @Binding var city :String
    @Binding var pin : String
    @Binding var sheetPresented : Bool
   // @Binding private var date : Date
    var body: some View {
        VStack{
            Text("Tittle to search")
                .font(.title)
            HStack{
                VStack{
                    
                    Text("Delivery address is")
                    Text(name)
                    Text(street)
                    Text("\(houseNo)")
                    Text(city)
                    Text(pin)
                } .padding(15)
                    //.padding(.top,15)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.yellow.opacity(0.3)))
                Image("delivery addresse")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 155,height: 155)
            }.padding(.bottom,15)
            
            ForEach($appViewModel.products, id: \.self) { $product in
                HStack{
                    VStack{
                        Text(product.category)
                        Text(product.shopName ?? "")
                       
                    }
                    .padding(15)
                    // .padding(.top,15)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.yellow.opacity(0.3)))
                    Image("shop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 155,height: 100)
                }
                VStack{
                    VStack{
                     Text("calculated Distance : 10 km")
                      
                        Text("Duration to reach : 20 min")
                       
                    }.padding(15)
                    // .padding(.top,15)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.yellow.opacity(0.3)))
                }
                
            }
            Spacer()
            Button("cancel"){
                sheetPresented = false
                ShoppingCartView()
                
            }.font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding()
                .padding(.horizontal, 8)
                .background(Color.purple)
                .cornerRadius(10.0)
        }
       
    }
}

struct DeliveryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailsView(name: .constant("Dinsha"), street: .constant("Street"), houseNo:.constant("20"), city:.constant("Berlin"), pin:.constant("16766"), sheetPresented: .constant(true))
            .environmentObject(AppViewModel())
    }
}
