//
//  CityRowView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI

struct CityRowView: View {
  
  // MARK: - Property
  @State var city: City
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading, spacing: Constants.General.spacing) {
      Text(city.name)
        .font(.title2)
      Text("Latitude: \(city.lat)")
        .font(.caption2)
      Text("Longitude: \(city.lon)")
        .font(.caption2)
    }
  }
}

// MARK: - Preview
struct CityRowView_Previews: PreviewProvider {
  static var previews: some View {
    CityRowView(city: CityData.cities[2])
  }
}
