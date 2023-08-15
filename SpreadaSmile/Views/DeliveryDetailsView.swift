//
//  DeliveryDetailsView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 07.07.23.
//
import MapKit
import SwiftUI
import UIKit

struct DeliveryDetailsView: View {
   // var shopName :ProductCategories
    @EnvironmentObject var appViewModel : AppViewModel
    @Binding var name : String
    @Binding var street :String
    @Binding var houseNo :String
    @Binding var city :String
    @Binding var pin : String
    @Binding var sheetPresented : Bool
    @StateObject private var mapAPI = MapAPI()
    @State var mapPresented = false
     @State private var text = ""
     
    var body: some View{
        ScrollView{
            VStack{
                Text("Your gift will be delivered soon...")
                    .font(.title)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                HStack{
                    VStack{
                        
                        Text("Delivery address is")
                        Text(name)
                        Text(street)
                        Text("\(houseNo)")
                        Text(city)
                        Text(pin)
                    } .padding(15)
                    //.padding(.top,15)
                        .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                        .foregroundColor(.white)
                    //Spacer()
                    MyMapView()
                        .frame(width: 155,height: 155)
                    /*Image("delivery addresse")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 155,height: 155)
                     .border(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                     .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))*/
                        .padding()
                }.padding(.bottom,15)
                
                ForEach($appViewModel.products, id: \.self) { $product in
                    HStack{
                        VStack{
                            Text(product.category)
                            Text(product.shopName ?? "")
                            
                        }
                        .padding(15)
                        // .padding(.top,15)
                        .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                        .foregroundColor(.white)
                        // MyMapView()
                        .frame(width: 155,height: 155)
                        /*  Image("shop")
                         .resizable()
                         .scaledToFit()
                         .frame(width: 155,height: 100)
                         .border(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/)
                         .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))*/
                        .padding()
                    }
                    VStack{
                        VStack{
                            Text("calculated Distance : 10 km")
                            
                            Text("Duration to reach : 20 min")
                            
                        }.padding(15)
                        // .padding(.top,15)
                            .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                            .foregroundColor(.white)
                    }
                    
                }
                Spacer()
                HStack{
                    Button("ShowDirections"){
                        self.mapPresented = true
                    }.font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 8)
                        .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                        .cornerRadius(10.0)
                        .sheet(isPresented: $mapPresented){
                            print("cancel")
                        }
                content:{
                    MapView(mapPresented: $mapPresented)
                }
                    Button("cancel"){
                        sheetPresented = false
                        
                        
                    }.font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 8)
                        .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                        .cornerRadius(10.0)
                }
            }
        }
    }
}

struct DeliveryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryDetailsView(name: .constant("Dinsha"), street: .constant("Street"), houseNo:.constant("20"), city:.constant("Berlin"), pin:.constant("16766"), sheetPresented: .constant(true))
            .environmentObject(AppViewModel())
    }
}
struct MyMapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    //@Binding var directions: [String]
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
  /*  func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }*/
}
