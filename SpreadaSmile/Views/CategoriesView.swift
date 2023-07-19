//
//  CategoriesView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 06.07.23.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var apiViewModel : ApiCallViewModel
    @EnvironmentObject var appViewModel : AppViewModel
    var category :ProductCategories
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
       
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(ProductCategories.productTrending, id: \.id) { category in
                        NavigationLink(destination: HomeView(category: category)
                            .environmentObject(apiViewModel)){
            
                                CategoryCard(productCategory: category)
                            }
                    }
                }
                .padding()
            }
            .navigationTitle(Text("SpreadaSmile"))
            .navigationDestination(for:ProductCategories.self, destination: {category in
                CategoriesView(category: category)
                
            })
            .toolbar {
                NavigationLink {
                    ShoppingCartView()
                        .environmentObject(appViewModel)
                } label: {
                    CartButton(numberOfProducts: appViewModel.products.count)
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(category: ProductCategories(id: UUID(), name: "Gifts", image: "")).environmentObject(ApiCallViewModel())
            .environmentObject(AppViewModel())
    }
}
