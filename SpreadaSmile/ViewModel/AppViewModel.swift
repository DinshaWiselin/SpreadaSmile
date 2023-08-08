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
       
    //FirebaseApp.configure()
  }
  // Payment-related variables
  // let paymentHandler = PaymentHandler()

  func addToCart(product: Product) {
    products.append(product)
    total += product.price * Double(product.numberOfProduct ?? 1)
    guard let userId = Auth.auth().currentUser?.uid else { return }
      print("checkkkkk check")
    /*let db = Firestore.firestore()
     let ref = db.collection(path).document(product.category)
     ref.setData(["category":product.category, "price":total]){error in
     if let error = error{
     print(error.localizedDescription)
     }
     }*/
    //try db.collection(path).addDocument(from: product.category)
    let userDocument = db.collection(path).document(userId)
      let data:[Any] = [["category" : product.category,
              "Shop address" : product.shopName!,
         "price" : product.price,
              "numberOfProducts" : product.numberOfProduct!] as [String : Any]]
    /*  washingtonRef.updateData([
          "regions": FieldValue.arrayUnion(["greater_virginia"])
      ])*/
      userDocument.updateData(["items" :FieldValue.arrayUnion(data)])
     /* userDocument.setData(data){error in
      if let error = error{
        print(error.localizedDescription)
      }
    }*/
      listenProducts()
  }
    func removeFromCart(product:Product) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
    total -= product.price * Double(product.numberOfProduct ?? 1)
      let data:[Any] =
           [ ["category" : product.category,
              "Shop address" : product.shopName!,
         "price" : product.price,
              "numberOfProducts" : product.numberOfProduct!] as [String : Any]]
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
                        let resultProduct = Product(id: 1, price:resultPrice, category: resultCategory, description: "", image: "",numberOfProduct: resultNumberOf,shopName: resultShop)
                        newProducts.append(resultProduct)
                    }
                    self.products = newProducts
                }
            }
        }
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
     }*/
  }








