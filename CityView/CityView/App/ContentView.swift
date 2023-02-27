//
//  ContentView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI

struct ContentView: View {
  
  // Mark: - Property
  let cities = CityData.cities
  
  // Mark: - Body
  var body: some View {
    NavigationView {
      List(cities, id: \.name) { city in
        /*@START_MENU_TOKEN@*/Text(city.name)/*@END_MENU_TOKEN@*/
      }
    } //: NavigationView
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

// Mark: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
