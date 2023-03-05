//
//  CityRowView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct CityRowView: View {
  
  // MARK: - Property
  @State var city: City
  @State var distance = 0.0
  
  @StateObject var locationManager = LocationManager()
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading, spacing: Constants.General.spacing) {
      Text(city.name)
        .font(.title2)
      Text("Distance: \(distance, specifier: "%.1f") km")
        .font(.caption2)
    }
    .onAppear {
      distance = calculateDistance()
    }
  }
  
  // Calculate distance
  func calculateDistance() -> Double {
    var myLocation = CLLocation()
    
    // Get user location
    if let location = locationManager.location {
      
      myLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
      print("Current location latitude: \(myLocation.coordinate.latitude)")
    } else {
      myLocation = CLLocation(latitude: 59.437601, longitude: 18.066346)
      print("Default lcoation latitude: \(myLocation.coordinate.latitude)")
    }
    //City's location
    let cityLocation = CLLocation(latitude: city.lat, longitude: city.lon)
    
    //Measuring my distance to the city (in km)
    let distance = cityLocation.distance(from: myLocation) / 1000
    
    //Display the result in km
    print(String(format: "The distance to \(city.name) is %.01fkm \n", distance))
    
    return distance
    
  }
}

// MARK: - Preview
struct CityRowView_Previews: PreviewProvider {
  static var previews: some View {
    CityRowView(city: CityData.cities[2])
  }
}
