//
//  ContentView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct ContentView: View {
  
  // MARK: - Property
  @State private var cities = [City]()
  @StateObject var locationManager = LocationManager()
  
  @State var myLocation = CLLocation(latitude: 0.0, longitude: 0.0)
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      List(cities) { city in
        NavigationLink(destination: CityDetailView(city: city)) {
          CityRowView(city: city, myLocation: $myLocation)
        } //: NavigationLink
      } //: List
      .task {
        do {
          cities = try await NetworkService().loadData()
        } catch {
          cities = []
        }
      }
      .navigationBarTitle(Constants.General.appName, displayMode: .large)
    } //: NavigationView
    .navigationViewStyle(StackNavigationViewStyle())
    
    // Get current location
    VStack {
      switch locationManager.authorizationStatus {
          // Location services are available.
        case .authorizedWhenInUse:
          
          let myLocation = CLLocation(latitude: locationManager.location?.latitude ?? 0.0, longitude: locationManager.location?.longitude ?? 0.0)
          
          Text("Your current location is:")
          if (myLocation.coordinate.latitude == 0.0) {
            // Show progress spinner while fetching location data
            ProgressView()
          } else {
            Text("Latitude: \(myLocation.coordinate.latitude.description)")
            Text("Longitude: \(myLocation.coordinate.longitude.description)")
//            updateDistance()
          }
        case .restricted, .denied:  // Location services currently unavailable.
          Text("Current location data was restricted or denied.")
        case .notDetermined:        // Authorization not determined yet.
          Text("Finding your location...")
          ProgressView()
        default:
          ProgressView()
      }
    }
    
//    func updateDistance() {
//    }
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
