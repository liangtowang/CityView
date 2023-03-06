//
//  CityDetailView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI
import MapKit

struct CityDetailView: View {
  // MARK: - Property
  @State var city: City
  // MARK: - Body
  var body: some View {
    ZStack {
      // Map of the city
      MapView(city: city)

      // Get points array from string
      let pointsArray = city.points.components(separatedBy: ",")
      Star(corners: pointsArray.count, smoothness: 0.4)
        .stroke(.red)
        .frame(width: 200, height: 200)
    }
  }
}

// MARK: - Preview
struct CityDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CityDetailView(city: CityData.cities[1])
  }
}
