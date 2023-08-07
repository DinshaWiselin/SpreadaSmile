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
         SmileSpreaderView()
                .tabItem {
                    Text("Home")
                    
                    Image(systemName: "house.circle.fill")
                }.tag(1)
            
          DummyView()
                .tabItem {
                    Text("Gifts")
                    Image(systemName: "gift.circle.fill")
               }.tag(2)
            FavoritesView()
                .tabItem{
                    Text("Favorites")
                    Image(systemName: "heart.circle.fill")
                }
        }.accentColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
          
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppViewModel())
    }
}
