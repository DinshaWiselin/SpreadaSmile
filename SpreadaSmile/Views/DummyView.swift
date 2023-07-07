//
//  DummyView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 04.07.23.
//

import SwiftUI

struct DummyView: View {
    @EnvironmentObject var authservice : FirebaseAuthService
    @StateObject var viewModel = ApiCallViewModel()
    var body: some View {
        NavigationStack(path: $viewModel.navPath){
            
              if ($viewModel.products.isEmpty){
             
             Button(action: {viewModel.fetchProducts()}){
             
             Text("Load Characters !")
             
             }
             
             
             }
             else {
            
            List {
                
                ForEach (viewModel.filteredProducts, id: \.self){myproduct in
                    SingleProduct(product: myproduct)
                        .onTapGesture {
                            viewModel.navPath.append(myproduct)
                        }
                        .listStyle(.plain)
                        .navigationTitle("Gifts")
                        .onAppear{
                            viewModel.fetchProducts()
                        }
                        .navigationDestination(for: Products.self, destination: {product in
                            Text(product.description).padding(4)
                            
                        })
                     VStack(alignment: .leading){
                     
                     AsyncImage(url: URL(string: myproduct.image)){ image in
                     image
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     } placeholder: {
                     Image(systemName: "photo.fill")
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     }
                     
                     HStack{
                     
                     Text("Name: ")
                     Text(myproduct.category)
                     
                     }
                     HStack{
                     
                     Text("Details: ")
                     Text(myproduct.description)
                     
                     }
                     HStack{
                     
                     Text("Status: ")
                     Text("\(myproduct.price)")
                     
                     }
                     }
                     }
                     
                     }
                    
                    
                    
                }/*.searchable(text: $viewModel.searchProduct)
                    .padding()
                Text("Hello : \(authservice.user?.email ?? "Not")")
                 
                 Button("SignOut"){
                 authservice.signOut()
                 }*/
                
            }.searchable(text: $viewModel.searchProduct)
            .padding()
        }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
