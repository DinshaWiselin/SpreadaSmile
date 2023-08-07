// ShoppingCartView.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 07.07.23.
//
import SwiftUI
struct ShoppingCartView: View {
  @EnvironmentObject var appViewModel : AppViewModel
    @State var name : String = ""
    @State var street :String = ""
    @State var houseNo :String = ""
    @State var city :String = ""
    @State var pin : String = ""
    @State private var date = Date()
    @State var sheetPresented = false
  var body: some View {
    ScrollView {
      /*if appViewModel.paymentSuccess {
        Text("Thanks for your purchase! You'll also receive an email confirmation shortly.")
          .padding()
      } else {*/
        if appViewModel.myProduct.numberOfProduct ?? 1 > 0 {
            ForEach($appViewModel.products, id: \.self) { $product in
                ProductRow(product: product).onTapGesture{
                    appViewModel.removeFromCart(product : product)
                }
            }
            HStack {
                Text("Your cart total is")
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("$\(String(format: " %.2f", appViewModel.total))")
                //  Text("$\(appViewModel.total).00")
                    .bold()
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
            }
            .padding()
            VStack{
            VStack{
                Text("Please enter your Delivery details")
                    .font(.title2)
                   
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                TextField("Name", text: $name)
                    
                    .textFieldStyle(.roundedBorder)
                    .padding(.top,10)
    
                    .shadow(radius: 3)
                TextField("StreetName", text: $street)
                    .textFieldStyle(.roundedBorder)
                   .padding(.top,8)
                    
                    .shadow(radius: 3)
                TextField("HouseNo", text: $houseNo)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top,8)
                    
                    .shadow(radius: 3)
                TextField("City", text: $city)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top,8)
                   
                    .shadow(radius: 3)
                TextField("PinCode", text: $pin)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top,8)
                    
                    .shadow(radius: 3)
                DatePicker(selection: $date,
                           label: { Text("Delivery Date").padding(.horizontal,8)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)

                })
                
                .padding(.top,8)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                
                .shadow(radius: 3)
                
            }
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(15)
            .padding(.top,15)
                
           // .background(.purple)
            //.cornerRadius(30)
            .background(RoundedRectangle(cornerRadius: 15).fill(.yellow.opacity(0.3)))
            /*PaymentButton(action: appViewModel.pay)
             .padding()*/
            Button("save"){
                self.sheetPresented.toggle()
            }.font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                 //   .foregroundColor(.black)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.yellow.opacity(0.3)))
                    .cornerRadius(10.0)
            .sheet(isPresented: $sheetPresented){
                print("cancel")
            }
            content:{
                DeliveryDetailsView(name: $name, street: $street, houseNo: $houseNo, city: $city, pin: $pin,sheetPresented: $sheetPresented)
            }
        }
        } else {
          Text("Your cart is empty.")
        }
      // }
    }
    .navigationTitle("My Cart")
     .padding(.top)
     .onDisappear {
     if appViewModel.paymentSuccess {
     appViewModel.paymentSuccess = false
     }
     }
  }
}
struct ShoppingCartView_Previews: PreviewProvider {
  static var previews: some View {
      ShoppingCartView()
      .environmentObject(AppViewModel())
  }
}





















