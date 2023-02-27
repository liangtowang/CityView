//
//  City.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import Foundation

struct Response: Decodable {
  var cities: [City]
}

struct City: Decodable {
  let name: String
  let lat: Double
  let lon: Double
}
