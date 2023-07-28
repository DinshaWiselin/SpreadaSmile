
// Products.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 28.06.23.
//
import Foundation
import Firebase

struct Product : Codable,Hashable{
  var id : Int
  var price : Double
  var category : String
  var description :String
  var image : String
  var numberOfProduct:Int? = 1
  var shopName :String? = "Shop Name and Address"
    mutating func getShop(){
        switch self.category {
      case "jewelery":
          self.shopName = "Maha Jwellery, 2nd Street, Chennai"
      case "men's clothing":
            self.shopName = "Shopify, 16761, Spandau"
      case "women's clothing":
            self.shopName = "Women's world, 36095, Belrin"
      case "electronics":
            self.shopName = "Trend Electro, 166622, Kreusberg"
      default:
            self.shopName = "Nothing"
      }
       
    }
  mutating func increment(){
    self.numberOfProduct = (self.numberOfProduct ?? 1) + 1
  }
  mutating func decrement(){
    self.numberOfProduct = (self.numberOfProduct ?? 1) - 1
  }
  static var dummyProduct = Product(id: 30,price: 145.00, category: "Jwellery", description: "pure gold", image: "yellow")
}
var dummyProduct1 = [Product(id: 30,price: 145.00, category: "Jwellery", description: "pure gold", image: "yellow")]







