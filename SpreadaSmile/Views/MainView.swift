//
//  MainView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 06.07.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
         HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.circle.fill")
                }.tag(1)
          CategoriesView()
                .tabItem {
                    Text("Gifts")
                    Image(systemName: "gift.circle.fill")
               }.tag(2)
            FavoritesView()
                .tabItem{
                    Text("Favorites")
                    Image(systemName: "heart.circle.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
