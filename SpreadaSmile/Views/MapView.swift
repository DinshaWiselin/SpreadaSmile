//
//  MapView.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 08.08.23.
//

import MapKit
import SwiftUI
import UIKit

struct MapView: View {
    @State private var directions: [String] = []
    @State private var showDirections = false
    @Binding var mapPresented : Bool
    var body: some View {
        
        VStack {
           MyMapView(directions: $directions)
            HStack{
                Button(action: {
                    self.showDirections.toggle()
                }, label: {
                    Text("Directions")
                }).font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                    .cornerRadius(10.0)
                    .disabled(directions.isEmpty)
                    .padding()
                Button("cancel"){
                     mapPresented = false
                     //ShoppingCartView()
                     
                 }.font(.title3)
                     .fontWeight(.semibold)
                     .foregroundColor(.white)
                     .padding()
                     .padding(.horizontal, 8)
                     .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                     .cornerRadius(10.0)
            }
        }.sheet(isPresented: $showDirections, content: {
            VStack(spacing: 0) {
                Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Divider().background(Color(UIColor.systemBlue))
                
                List(0..<self.directions.count, id: \.self) { i in
                    Text(self.directions[i]).padding()
                } .padding(15)
                    .padding(.top,15)
                    .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
              /*  Button("cancel"){
                    mapPresented = false
                    //ShoppingCartView()
                    
                }.font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(RoundedRectangle(cornerRadius: 15).fill(/*@START_MENU_TOKEN@*/Color(red: 0.641, green: 0.203, blue: 0.207)/*@END_MENU_TOKEN@*/))
                    .cornerRadius(10.0)*/
            }
        })
    }
    
    
    
    struct MyMapView: UIViewRepresentable {
        typealias UIViewType = MKMapView
        
        @Binding var directions: [String]
        
        func makeCoordinator() -> MapViewCoordinator {
            return MapViewCoordinator()
        }
        
        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView()
            mapView.delegate = context.coordinator
            
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 52.531677, longitude: 13.381777),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            mapView.setRegion(region, animated: true)
            
            // NYC
            let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 52.534080, longitude: 13.181716))
            
            // Boston
            let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 52.632048, longitude: 13.201140))
            
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: p1)
            request.destination = MKMapItem(placemark: p2)
            request.transportType = .automobile
            
            let directions = MKDirections(request: request)
            directions.calculate { response, error in
                guard let route = response?.routes.first else { return }
                mapView.addAnnotations([p1, p2])
                mapView.addOverlay(route.polyline)
                mapView.setVisibleMapRect(
                    route.polyline.boundingMapRect,
                    edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                    animated: true)
                self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
            }
            return mapView
        }
        
        func updateUIView(_ uiView: MKMapView, context: Context) {
        }
        
        class MapViewCoordinator: NSObject, MKMapViewDelegate {
            func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
                let renderer = MKPolylineRenderer(overlay: overlay)
                renderer.strokeColor = .systemBlue
                renderer.lineWidth = 5
                return renderer
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapPresented: .constant(true))
    }
}
