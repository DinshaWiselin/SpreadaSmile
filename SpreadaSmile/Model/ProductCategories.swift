//
//  ProductCategories.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 12.07.23.
//

import Foundation
struct ProductCategories: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    
}

var productCategory = [ProductCategories(name: "TrendingCategories", image: "sweater1"),
                       ProductCategories(name: "PersonalisedGifts", image: "sweater1"),
                       ProductCategories(name: "Flowers", image: "sweater1")]
