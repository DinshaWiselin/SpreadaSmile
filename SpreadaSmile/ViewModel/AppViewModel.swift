//
// AppViewModel.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 12.07.23.
//
import Foundation
class AppViewModel : ObservableObject{
  @Published var products: [Products] = []
  @Published var total: Double = 0.0
  @Published var myProduct = Products(id: 2, price: 12.0, category: "", description: "", image: "")
  // Payment-related variables
    // let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
  func addToCart(product: Products) {
    products.append(product)
    total += product.price * Double(product.numberOfProducts ?? 1)
  }
  func removeFromCart(product: Products) {
    products = products.filter { $0.id != product.id }
    total -= product.price * Double(product.numberOfProducts ?? 1)
  }
  /*func pay() {
    paymentHandler.startPayment(products: products, total: total) { success in
      self.paymentSuccess = (success != 0)
      self.products = []
      self.total = 0
    }
  }
  func getCurrentProduct(id : Int){
    self.myProduct = ProductsCount(product:apiCall.products.first(where : {$0.id == id})!, numberOfProducts: 1)
  }
   */
}
