//
//  HomeView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 27.06.23.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var authservice : FirebaseAuthService
    @EnvironmentObject var viewModel : ApiCallViewModel
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var category :ProductCategories
    var body: some View {
       
        
        NavigationStack(path: $viewModel.navPath){
            ZStack{
                
                List{
                  // LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(viewModel.products , id: \.self){ product in
                            
                            if product.category == category.name
                            {
                                NavigationLink(destination: GiftDetailsView(product: product), label:{
                                    SingleProduct(product: product)
                                   let _ = print(product.isFavorite)
                                })
                            }
                        }
                 //  }
                }
                
                .listStyle(.plain)
                
                
                .navigationTitle("SpreadaSmile")
                
            
                /*.navigationDestination(for: Products.self, destination: {product in
                    GiftDetailsView(product: product)
                    
                })*/
                
            }
          
            
        }
        }
    }
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(category: ProductCategories(id: UUID(), name: "Jwellery", image: ""))
            .environmentObject(FirebaseAuthService())
            .environmentObject(ApiCallViewModel())
    }
}
