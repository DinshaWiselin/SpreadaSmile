// ShoppingCartView.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 07.07.23.
//
import SwiftUI
struct ShoppingCartView: View {
  @EnvironmentObject var appViewModel : AppViewModel

  var body: some View {
    ScrollView {
      /*if appViewModel.paymentSuccess {
        Text("Thanks for your purchase! You'll also receive an email confirmation shortly.")
          .padding()
      } else {*/
      if appViewModel.myProduct.numberOfProducts ?? 1 > 0 {
        ForEach(appViewModel.products, id: \.self) { product in
            ProductRow(product: product).onTapGesture {
              appViewModel.removeFromCart(product: product)
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





















