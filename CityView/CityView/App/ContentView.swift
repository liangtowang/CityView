//
//  ContentView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: - Property
  let cities = CityData.cities
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      List(cities, id: \.name) { city in
        CityRowView(city: city)
      }
    } //: NavigationView
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}