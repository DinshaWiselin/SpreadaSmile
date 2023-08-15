//
//  FavoritesView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 06.07.23.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel : ApiCallViewModel
    var body: some View {
        ZStack{
            List{
                ForEach(viewModel.savedFavorites,id: \.self){fav in
                   // SingleProduct(product: fav)
                    Text(fav.description)
                    
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
