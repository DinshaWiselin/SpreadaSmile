//
//  DeliveryDetailsView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 07.07.23.
//

import SwiftUI

struct DeliveryDetailsView: View {
   // var shopName :ProductCategories
    @State var name : String = ""
    @State var street :String = ""
    @State var houseNo :Int = 20
    @State var city :String = ""
    @State var pin : String = ""
    @State private var date = Date()
    var body: some View {
        VStack{
           
        }
       
    }
}

struct DeliveryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailsView()
    }
}
