
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
    // new variable for shopingCartView
  var numberOfProduct:Int? = 1
    //new variable for FavoritesView
  var isFavorite:Bool? = false
    //new variable for DeliveryDetailsView
  var shopName :String? = "Shop Name and Address"
    mutating func getShop(){
        switch self.category {
      case "jewelery":
          self.shopName = "Trend Design Jewellery,Klosterstraße 3, 13581 Berlin"
      case "men's clothing":
            self.shopName = "Engbers, Brunsbütteler Damm 112, 13581 Berlin"
      case "women's clothing":
            self.shopName = "VERO MODA, Klosterstraße 3, 13581 Berlin"
      case "electronics":
            self.shopName = "Trend Electro,An den Freiheitswiesen 5, 13597 Berlin"
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
  static var dummyProduct = Product(id: 30,price: 145.00, category: "Jwellery", description: "pure gold", image: "Sweets")
}
var dummyProduct1 = [Product(id: 30,price: 145.00, category: "Jwellery", description: "pure gold", image: "yellow")]







