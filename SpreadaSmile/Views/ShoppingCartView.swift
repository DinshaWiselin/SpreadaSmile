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
    @State var houseNo :Int = 20
    @State var city :String = ""
    @State var pin : String = ""
    @State private var date = Date()
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
            Spacer()
              Text("$\(String(format: " %.2f", appViewModel.total))")
          //  Text("$\(appViewModel.total).00")
              .bold()
          }
          .padding()
          VStack{
              Text("Please enter your Delivery details")
                  .font(.title2)
              TextField("Name", text: $name)
                  .textFieldStyle(.roundedBorder)
                  .padding()
                  .foregroundColor(.purple)
                  .shadow(radius: 20)
              TextField("StreetName", text: $street)
                  .textFieldStyle(.roundedBorder)
                  .padding()
                  .foregroundColor(.purple)
                  .shadow(radius: 20)
              //TextField("HouseNo", text: $houseNo)
                  .textFieldStyle(.roundedBorder)
                  .padding()
                  .foregroundColor(.purple)
                  .shadow(radius: 20)
              TextField("City", text: $city)
                  .textFieldStyle(.roundedBorder)
                  .padding()
                  .foregroundColor(.purple)
                  .shadow(radius: 20)
              TextField("PinCode", text: $pin)
                  .textFieldStyle(.roundedBorder)
                  .padding()
                  .foregroundColor(.purple)
                  .shadow(radius: 20)
              DatePicker(selection: $date,
                         label: { Text("Delivery Date") })
              Button("save") {
                  DeliveryDetailsView()
              }
          }
          /*PaymentButton(action: appViewModel.pay)
           .padding()*/
          
        } else {
          Text("Your cart is empty.")
        }
      // }
    }
    .navigationTitle(Text("My Cart"))
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





















