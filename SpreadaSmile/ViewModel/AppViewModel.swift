//
// AppViewModel.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 12.07.23.
//
import Foundation
import FirebaseFirestore
import FirebaseAuth
import SwiftUI
class AppViewModel : ObservableObject{
  var firebase = FirebaseAuthService()
  let db = Firestore.firestore()
  var path : String = "product"
  @Published var products: [Product] = []
  @Published var total: Double = 0.0
  @Published var myProduct = Product(id: 2, price: 12.0, category: "", description: "", image: "")
  @Published var shopName : String = ""
    @Published var paymentSuccess = false
     
   init(){
       listenProducts()
    //FirebaseApp.configure()
  }

  func addToCart(product: Product) {
    products.append(product)
    total += product.price * Double(product.numberOfProduct ?? 1)
   guard let userId = Auth.auth().currentUser?.uid else { return }
     let userDocument = db.collection(path).document(userId)
      let data:[String : Any] = ["category" : product.category,
               "Shop address" : product.shopName!,
          "price" : product.price,
               "numberOfProducts" : product.numberOfProduct!,
                                 "description" : product.description,
                                 "image" : product.image] as [String : Any]
    

    //  db.collection(path).addDocument(data: ["items" : data])
    
      userDocument.getDocument { (document, error) in
            if let error = error {
                print("Error fetching document: \(error.localizedDescription)")
                return
            }
            if let document = document, document.exists {
                // Update if the document already exists
                userDocument.updateData(["items": FieldValue.arrayUnion([data])])
            } else {
                // Set data if the document does not exist
                userDocument.setData(["items" : [data]])
            }
        }
      listenProducts()
  }
    func removeFromCart(product:Product) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
    total -= product.price * Double(product.numberOfProduct ?? 1)
     /* let data:[Any] =
           [ ["category" : product.category,
              "Shop address" : product.shopName!,
         "price" : product.price,
              "numberOfProducts" : product.numberOfProduct!] as [String : Any]]*/
        let data:[Any] = [ ["category" : product.category,
                 "Shop address" : product.shopName!,
            "price" : product.price,
                 "numberOfProducts" : product.numberOfProduct!,
                                   "description" : product.description,
                                   "image" : product.image] as [String : Any]]
        let userDocument = db.collection(path).document(userId)
       userDocument.updateData(["items" :FieldValue.arrayRemove(data)]){error in
            if let error = error{
               print(error)
            }else{
                self.listenProducts()
            }
        }
      
   
  }
    func listenProducts(){
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let userDocument = db.collection(path).document(userId)
        userDocument.getDocument{document, error in
            if let error = error{
              print(error.localizedDescription)
            }
            if let document = document, document.exists{
                if let data = document.data(){
                    let cartItems = data["items"] as? [[String:Any]]
                   // let content = messageData["content"] as? String,
                    var newProducts : [Product] = []
                    cartItems?.forEach{cart in
                        let resultCategory = cart["category"] as! String
                        let resultShop = cart["Shop address"] as! String
                        let resultPrice = cart["price"] as! Double
                        let resultNumberOf = cart["numberOfProducts"] as! Int
                        let resultImage = cart["image"] as! String
                        let resultDescription = cart["description"] as! String
                        let resultProduct = Product(id: 1, price:resultPrice, category: resultCategory, description: resultDescription, image: resultImage, numberOfProduct: resultNumberOf,shopName: resultShop)
                        newProducts.append(resultProduct)
                    }
                    self.products = newProducts
                }
            }
        }
        print(self.products)
    }
  }








