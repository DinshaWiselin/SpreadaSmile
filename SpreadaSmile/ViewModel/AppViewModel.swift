//
//  AppViewModel.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 12.07.23.
//

import Foundation
class AppViewModel:ObservableObject{
    @Published private(set) var products: [Products] = []
    @Published private(set) var total: Int = 0
    
    // Payment-related variables
       // let paymentHandler = PaymentHandler()
        @Published var paymentSuccess = false
    func addToCart(product: Products) {
        products.append(product)
        total += Int(product.price)
    }
    
    func removeFromCart(product: Products) {
        products = products.filter { $0.id != product.id }
        
        total -= Int(product.price)
    }
    /*func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = (success != 0)
            self.products = []
            self.total = 0
        }
    }*/
}
