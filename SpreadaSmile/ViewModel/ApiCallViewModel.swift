
//
// ApiCallViewModel.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 28.06.23.
//
import Foundation
import SwiftUI
import Firebase
class ApiCallViewModel:ObservableObject{
  // var apikey = ""
  @Published var products: [Product] = []
  @Published var searchProduct: String = ""
  @Published var navPath = NavigationPath()
  @Published var showFavoritesOnly = false
  var savedFavorites: [Int] = []
  @Published var isReady = false
  var isAnimated = false
 //@Published var random = 0
  var highLighted: [Product] {
      guard !self.isAnimated else {
      return self.products
    }
    return self.products.filter { product in
      product.price <= 200.00
    }
  }
  init(){
    fetchProducts()
  }
  var filteredProducts: [Product] {
      guard !searchProduct.isEmpty
    else {
        return products
         
      }
      return products.filter { product in
        product.category.lowercased().contains(searchProduct.lowercased())
      }
    }
  func fetchProducts(){
    //MARK: SCHRITT 1: URL DEFINIEREN
    guard let url = URL(string:"https://fakestoreapi.com/products")
    else{
      print("Error forming URL")
      return
    }
  
    //MARK: SCHRITT 2: URL SESSION & DATA TASK ANLEGEN
    /* let task = URLSession.shared.dataTask(with: url){data,rescode,error in
      print(rescode as Any)
      guard let data = data,error == nil
      else{
        print(error as Any)
        return
      }*/
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
          guard let data = data , error == nil else{
            print(error as Any)
            return
          }
      //MARK: SCHRITT 3: DATEN DECODEN
      do{
        let productFeed = try JSONDecoder().decode([Product].self, from: data)
        DispatchQueue.main.async {
          self.products = productFeed
          
          //print(self.products)
             
        // self.random = Int.random(in: 0..<self.highLighted.count)
          self.isReady = true
           
        }
      }
      catch{
        print(error)
      }
    }
     
    //MARK: SCHRITT 4: API CALL STARTEN
    task.resume()
  }
    
    func updateFavorites() {
        print(products)
        for product in products {
            if product.isFavorite ?? false && !savedFavorites.contains(product.id) {
                savedFavorites.append(product.id)
            } else if !(product.isFavorite ?? true) && savedFavorites.contains(product.id) {
                let idx = savedFavorites.firstIndex { $0 == product.id }
                guard idx != nil else { return }
                savedFavorites.remove(at: idx!)
            }
        }
        UserDefaults.standard.set(savedFavorites, forKey: "favourites")
        print(savedFavorites)
    }
    func getFavorites() {
        if let retrievedFavorites = UserDefaults.standard.object(forKey: "favourites") as? [Int] {
            savedFavorites = retrievedFavorites
        }
        for idx in 0..<products.count {
            if savedFavorites.contains(products[idx].id) {
                products[idx].isFavorite = true
            }
        }
    }

}






