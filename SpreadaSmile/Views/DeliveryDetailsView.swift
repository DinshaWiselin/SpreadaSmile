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
        Text("Please enter your Delivery details")
            .font(.title2)
        TextField("Name", text: $name)
            .textFieldStyle(.roundedBorder)
            .padding()
            .foregroundColor(.purple)
            .shadow(radius: 20)
        TextField("StreetName", text: $street)
            .textFieldStyle(.roundedBorder)
            .padding()
            .foregroundColor(.purple)
            .shadow(radius: 20)
        //TextField("HouseNo", text: $houseNo)
            .textFieldStyle(.roundedBorder)
            .padding()
            .foregroundColor(.purple)
            .shadow(radius: 20)
        TextField("City", text: $city)
            .textFieldStyle(.roundedBorder)
            .padding()
            .foregroundColor(.purple)
            .shadow(radius: 20)
        TextField("PinCode", text: $pin)
            .textFieldStyle(.roundedBorder)
            .padding()
            .foregroundColor(.purple)
            .shadow(radius: 20)
        DatePicker(selection: $date,
                   label: { Text("Delivery Date") })
    }
}

struct DeliveryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailsView()
    }
}
