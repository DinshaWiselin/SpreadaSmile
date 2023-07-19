//
//  AppViewModel.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 12.07.23.
//

import Foundation
class AppViewModel : ObservableObject{
    @Published private(set) var products: [ProductsCount] = []
    var apiCall : ApiCallViewModel
    @Published private(set) var total: Int = 0
    
    @Published var myProduct = ProductsCount(product: Products(id: 2, price: 12.0, category: "", description: "", image: ""))
    // Payment-related variables
       // let paymentHandler = PaymentHandler()
        @Published var paymentSuccess = false
    init(apiCall : ApiCallViewModel){
        self.apiCall = apiCall
    }
    func addToCart(product: ProductsCount) {
        products.append(product)
        total += Int(product.product.price)
    }
    
    func removeFromCart(product: ProductsCount) {
        products = products.filter { $0.product.id != product.product.id }
        
        total -= Int(product.product.price)
    }
    /*func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = (success != 0)
            self.products = []
            self.total = 0
        }
    }*/
    func getCurrentProduct(id : Int){
        self.myProduct = ProductsCount(product:apiCall.products.first(where : {$0.id == id})!, numberOfProducts: 1)
    }
}
