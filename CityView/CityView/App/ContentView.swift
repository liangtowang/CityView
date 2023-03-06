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
  
  @State var myLocation = CLLocation(latitude: Constants.General.zero, longitude: Constants.General.zero)
  
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
          
          let myLocation = CLLocation(
            latitude: locationManager.location?.latitude ?? Constants.General.zero,
            longitude: locationManager.location?.longitude ?? Constants.General.zero)
          
          Text(Constants.String.yourLocation)
          if (myLocation.coordinate.latitude == Constants.General.zero) {
            // Show progress spinner while fetching location data
            ProgressView()
          } else {
            Text(Constants.String.latitude + "\(myLocation.coordinate.latitude)")
            Text(Constants.String.longitude + "\(myLocation.coordinate.longitude)")
          }
        case .restricted, .denied:  // Location services currently unavailable.
          Text(Constants.String.restritedOrDenied)
        case .notDetermined:        // Authorization not determined yet.
          Text(Constants.String.findLocation)
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
