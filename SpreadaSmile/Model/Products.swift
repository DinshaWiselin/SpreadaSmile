//
//  Products.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 28.06.23.
//

import Foundation
struct Products : Codable,Hashable{
    var id : Int
    var price : Double
    var category : String
    var description :String
    var image : String
   /* var numberOfProducts:Int = 1
    mutating func increment(){
        self.numberOfProducts = self.numberOfProducts + 1
    }
    mutating func decrement(){
        self.numberOfProducts = self.numberOfProducts - 1
    }*/
    static var dummyProduct = Products(id: 30,price: 145.00, category: "Jwellery", description: "pure gold", image: "yellow")
}
var dummyProduct1 = [Products(id: 30,price: 145.00, category: "Jwellery", description: "pure gold", image: "yellow")]
struct ProductsCount:Codable,Hashable{
    var product:Products
    var numberOfProducts:Int = 1
     mutating func increment(){
         self.numberOfProducts = self.numberOfProducts + 1
     }
     mutating func decrement(){
         self.numberOfProducts = self.numberOfProducts - 1
     }
}
