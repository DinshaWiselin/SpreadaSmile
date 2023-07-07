//
//  HomeView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 27.06.23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authservice : FirebaseAuthService
    @StateObject var viewModel = ApiCallViewModel()
    var body: some View {
       
        
        NavigationStack(path: $viewModel.navPath){
           

                List{
                    ForEach(viewModel.filteredProducts , id: \.self){ product in
                        SingleProduct(product: product)
                            .onTapGesture {
                                viewModel.navPath.append(product)
                            }
                    }
                    
                }
                
                .listStyle(.plain)
                
                
                 .navigationTitle("SpreadaSmile")
                
                .onAppear{
                    viewModel.fetchProducts()
                }
                
                .navigationDestination(for: Products.self, destination: {product in
                    DummyView()
                    
                })
            }
            .searchable(text: $viewModel.searchProduct)
        
        
        }
    }
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(FirebaseAuthService())
    }
}
