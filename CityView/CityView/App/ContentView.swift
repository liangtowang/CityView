//
//  ContentView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: - Property
  @State private var cities = [City]()
  
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
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
