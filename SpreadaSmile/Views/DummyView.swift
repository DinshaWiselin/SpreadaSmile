//
//  DummyView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 04.07.23.
//

import SwiftUI

struct DummyView: View {
    @EnvironmentObject var authservice : FirebaseAuthService
    //@StateObject var viewModel = ApiCallViewModel()
    @EnvironmentObject var appViewModel : AppViewModel
       var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(ProductCategories.productCategory, id: \.id) { category in
                        NavigationLink(destination: CategoriesView(category: category)
                            .environmentObject(appViewModel)){
            
                                CategoryCard(productCategory: category)
                            }
                            
                        
                    }
                }
                .padding()
            }
            .navigationTitle(Text("SpreadaSmile"))
           /* .navigationDestination(for:ProductCategories.self, destination: {category in
                CategoriesView(category: category)
                
            })*/
            .toolbar {
                NavigationLink {
                    ShoppingCartView()
                        .environmentObject(appViewModel)
                } label: {
                    CartButton(numberOfProducts: appViewModel.products.count)
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .onAppear{
                appViewModel.listenProducts()
            }
               }
               
        }


struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView().environmentObject(AppViewModel())
    }
}
