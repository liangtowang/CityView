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
      List(cities, id: \.name) { city in
        NavigationLink(destination: CityDetailView(city: city)) {
          CityRowView(city: city)
        } //: NavigationLink
      } //: List
      .task {
        await loadData()
      }
      .navigationBarTitle(Constants.General.appName, displayMode: .large)
    } //: NavigationView
    .navigationViewStyle(StackNavigationViewStyle())
  }
  
  // MARK: - LoadData
  func loadData() async {
    guard let url = URL(string: Constants.General.urlString) else {
      print("Invalid URL")
      return
    }
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      
      if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
        cities = decodedResponse.cities
      } else {
        cities = []
      }
    } catch {
      print("Invalid data")
    }
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
