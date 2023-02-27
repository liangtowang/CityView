//
//  CityDetailView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI

struct CityDetailView: View {
  
  // MARK: - Property
  @State var city: City
  
  // MARK: - Body
  var body: some View {
    Text(city.name)
  }
}

// MARK: - Preview
struct CityDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CityDetailView(city: CityData.cities[1])
  }
}
