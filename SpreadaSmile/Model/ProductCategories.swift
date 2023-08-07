//
//  ProductCategories.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 12.07.23.
//

import Foundation
struct ProductCategories: Identifiable,Hashable {
    var id = UUID()
    var name: String
    var image: String
    static var shopNames = [ProductCategories(name: "", image: ""),
                             ProductCategories(name: "", image: ""),
                             ProductCategories(name: "", image: ""),
                             ProductCategories(name: "", image: ""),
                             ProductCategories(name: "", image: ""),
                             ProductCategories(name: "", image: "")]
    static var productTrending = [ProductCategories(name: "jewelery", image: "jewells"),
                                  ProductCategories(name: "men's clothing", image: "Mens Wear"),
                                  ProductCategories(name: "electronics", image: "electronics"),
                                  ProductCategories(name: "women's clothing", image: "frauen kleider")]
    static var productCategory = [ProductCategories(name: "Trending Gifts", image: "Trend"),
                           ProductCategories(name: "Personalised", image: "Persnal"),
                           ProductCategories(name: "Flowers", image: "Flowers"),
                           ProductCategories(name: "By Occations", image: "giftbyOccasions"),
                           ProductCategories(name: "Sweets", image: "Sweets")]
}


