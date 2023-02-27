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
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      List(cities) { city in
        NavigationLink(destination: CityDetailView(city: city)) {
          CityRowView(city: city)
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
      if let myLocation = locationManager.location {
        VStack {
          Text("My location: \(myLocation.latitude), \(myLocation.longitude)")
            .font(.callout)
            .foregroundColor(.white)
            .padding()
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
      }
      
      LocationButton {
        locationManager.requestLocation()
      }
      .frame(width: 180, height: 40)
      .cornerRadius(30)
      .symbolVariant(.fill)
      .foregroundColor(.white)
    }
    .padding()
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
