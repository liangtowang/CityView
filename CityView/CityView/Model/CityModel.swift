//
//  City.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import Foundation
import CoreLocation

struct Response: Decodable {
  var cities: [City]
}

struct City: Identifiable, Decodable {
  var id = UUID()
  let name: String
  let lat: Double
  let lon: Double
  
  private enum CodingKeys: String, CodingKey {
    case name, lat, lon
  }
  
  // City coordinates
  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: lat, longitude: lon)
  }
}
