//
// AppViewModel.swift
// SpreadaSmile
//
// Created by Dinsha Wiselin Christudhas on 12.07.23.
//
import Foundation
import Firebase
import FirebaseCore
class AppViewModel : ObservableObject{
    var firebase = FirebaseAuthService()
    var db = Firestore.firestore()
    private var path : String = "product"
    @Published var products: [Products] = []
    @Published var total: Double = 0.0
    @Published var myProduct = Products(id: 2, price: 12.0, category: "", description: "", image: "")
    @Published var shopName : String = ""
    
   /* init(){
        FirebaseApp.configure()
    }*/
    // Payment-related variables
    // let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    func addToCart(product: Products) {
        products.append(product)
        total += product.price * Double(product.numberOfProducts ?? 1)
        guard let userId = Auth.auth().currentUser?.uid else { return }
        /*let db = Firestore.firestore()
         let ref = db.collection(path).document(product.category)
         ref.setData(["category":product.category, "price":total]){error in
         if let error = error{
         print(error.localizedDescription)
         }
         }*/
        
        //try db.collection(path).addDocument(from: product.category)
        var userDocument = db.collection(path).document(userId)
        let data:[String:Any] = [
            "items" :
                ["category" : product.category,
                 "price" : product.price,
                 "numberOfProducts" : product.numberOfProducts]
        ]
        userDocument.setData(data){error in
            if let error = error{
                print(error.localizedDescription)
                
            }
            
        }
    }
    func removeFromCart(product: Products) {
        products = products.filter { $0.id != product.id }
        total -= product.price * Double(product.numberOfProducts ?? 1)
        /* for index in indexSet
         {
         db.collection(path).document(products[index].id).delete()
         }*/
    }
   /* func listenProducts(){
        db.collection (path).addSnapshotListener{snapshot , error in
            guard let documents = snapshot? .documents
            else{
                print("No Documents found")
                return
            }
            self.myProduct = documents.map({querySnapshot -> product in
                let data = querySnapshot.data ( )
                let category = data["category"] as? String ?? ""
                let price = querySnapshot.price
                return products(price:myProduct.price, category:myProduct.category)
            })
            
        }*/
        func getShop(product: Products){
            switch product.category {
            case "Jwellery":
                shopName = "Maha Jwellery"
                
            case "men's clothing":
                shopName = "Shopify"
                
            case "women's clothing":
                shopName = "Women's world"
                
            case  "electronics":
                shopName = "Trend Electro"
            default:
                shopName = "Nothing"
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

