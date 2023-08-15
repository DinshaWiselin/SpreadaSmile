//
//  MapLocation.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 09.08.23.
//


import Foundation
import MapKit

// Address Data Model
struct Address: Codable {
   let data: [Datum]
}

struct Datum: Codable {
   let latitude, longitude: Double
   let name: String?
}

// Our Pin Locations
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
class MapAPI: ObservableObject{
   private let BASE_URL = "http://api.positionstack.com/v1/forward"
   private let API_KEY = "de93b91230d5632dca924f8cb684c82d"
   
   @Published var region: MKCoordinateRegion
   @Published var coordinates = []
   @Published var locations: [Location] = []
   
   
   init() {
      // Defualt Info
      self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.520008, longitude: 13.404954), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
      
      self.locations.insert(Location(name: "Pin", coordinate: CLLocationCoordinate2D(latitude: 52.520008, longitude: 13.404954)), at: 0)
   }
   
   // API request
   func getLocation(address: String, delta: Double) {
      let pAddress = address.replacingOccurrences(of: " ", with: "%20")
      let url_string = "\(BASE_URL)?access_key=\(API_KEY)&query=\(pAddress)"
   
      guard let url = URL(string: url_string) else {
         print("Invalid URL")
         return }
      
      URLSession.shared.dataTask(with: url) { (data, response, error) in
         guard let data = data else {
            print(error!.localizedDescription)
            return }
          guard let newCoordinates = try? JSONDecoder().decode(Address.self, from: data) else { return }
                   
                   if newCoordinates.data.isEmpty {
                      print("Could not find address...")
                      return
                   }
                   
                   // Set the new data
                   DispatchQueue.main.async {
                      let details = newCoordinates.data[0]
                      let lat = details.latitude
                      let lon = details.longitude
                      
                      self.coordinates = [lat, lon]
                      self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
                      
                      let new_location = Location(name: "\(details.name)", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
                      self.locations.removeAll()
                      self.locations.insert(new_location, at: 0)
                      
                      print("Successfully loaded location! \(details.name)")
                   }
                }
                .resume()
             }
          }
/*import Cocoa
import MapKit
import CoreLocation
//import PlaygroundSupport
//PlaygroundPage.current.needsIndefiniteExecution = true

let geocoder = CLGeocoder()
//geocoder.geocodeAddressString("1 Pall Mall East, London SW1Y 5AU") { (placemarks: [CLPlacemark]? , error: Error?) in
geocoder.geocodeAddressString("Tucholzskrstrasse 83,Hennigsdorf"){(placemarks, error) in
if let placemarks = placemarks {
        let start_placemark = placemarks[0]
        geocoder.geocodeAddressString("Buckingham Palace, London SW1A 1AA", completionHandler: { ( placemarks: [CLPlacemark]?, error: Error?) in
            if let placemarks = placemarks {
                let end_placemark = placemarks[0]

                // Okay, we've geocoded two addresses as start_placemark and end_placemark.
                let start = MKMapItem(placemark: MKPlacemark(coordinate: start_placemark.location!.coordinate))
                let end = MKMapItem(placemark: MKPlacemark(coordinate: end_placemark.location!.coordinate))

                // Now we've got start and end MKMapItems for MapKit, based on the placemarks. Build a request for
                // a route by car.
                let request: MKDirections.Request = MKDirections.Request()
                request.source = start
                request.destination = end
                request.transportType = MKDirectionsTransportType.automobile

                               // Execute the request on an MKDirections object
                               let directions = MKDirections(request: request)
                directions.calculate(completionHandler: { (response: MKDirections.Response?, error: Error?) in
                                   // Now we should have a route.
                                   if let routes = response?.routes {
                                       let route = routes[0]
                                       print(route.distance) // 2,307 metres.
                                   }
                               })
                           }
                       })
                   }
               }*/
