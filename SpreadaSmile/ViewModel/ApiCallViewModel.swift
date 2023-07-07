//
//  ApiCallViewModel.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 28.06.23.
//

import Foundation
import SwiftUI
class ApiCallViewModel:ObservableObject{
   // var apikey = ""
    @Published var products: [Products] = []
    @Published var searchProduct: String = ""
    @Published var navPath = NavigationPath()
    var filteredProducts: [Products] {
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
  
        //MARK: SCHRITT 2:  URL SESSION & DATA TASK ANLEGEN
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
                let productFeed = try JSONDecoder().decode([Products].self, from: data)
                DispatchQueue.main.async {
                   self.products = productFeed
                    print(self.products)
                }
            }
            catch{
                print(error)
            }
        }
        
        //MARK: SCHRITT 4: API CALL STARTEN
        task.resume()
    }
    
}
