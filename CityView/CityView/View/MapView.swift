//
//  MapView.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-28.
//

import SwiftUI
import MapKit

struct MapView: View {
  
  // MARK: - Property
  @State var city: City
  @State private var region = MKCoordinateRegion()
  
  // MARK: - Body
  var body: some View {
    Map(coordinateRegion: $region)
      .edgesIgnoringSafeArea(.all)
      .onAppear {
        setRegion(city.coordinate)
      }
  }
  
  // MARK: - SetRegion
  private func setRegion(_ coordinate: CLLocationCoordinate2D) {
    region = MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(city: CityData.cities[1])
  }
}
