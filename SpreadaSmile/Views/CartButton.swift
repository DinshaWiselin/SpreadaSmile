//
//  CartButton.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 12.07.23.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int 
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
                 .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                   .background(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(50)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 2)
    }
}
