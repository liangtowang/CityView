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
  let points: String

  private enum CodingKeys: String, CodingKey {
    case name, lat, lon, points
  }

  // City coordinates
  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: lat, longitude: lon)
  }

//  var locations: [CLLocationCoordinate2D] {
//    // Get points array from string
//    let pointsArray = points.components(separatedBy: ",")
//
//    for i in 0..<pointsArray.count {
//      let pointCoordinate = pointsArray[i].components(separatedBy: " ")
//
//      let lat = pointCoordinate[0]
//      let lon = pointCoordinate[1]
//      coordinate[i] = CLLocation(latitude: lat, longitude: lon)
//
//      locations.append(coordinate[i])
//    }
//    return locations
//  }

}
