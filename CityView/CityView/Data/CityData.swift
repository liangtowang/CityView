//
//  CityData.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import Foundation

// Dummy test data to fall back if no data is available
public class CityData {
  static let cities = [
    City(
      name: "Stockholm",
      lat: 59.339475,
      lon: 18.005875
    ),
    City(
      name: "Milan",
      lat: 45.4837341,
      lon: 9.1843982
    ),
    City(
      name: "Barcelona",
      lat: 41.4052974,
      lon: 2.165195
    ),
    City(
      name: "Berlin",
      lat: 52.507096,
      lon: 13.3826695
    ),
    City(
      name: "Rome",
      lat: 41.9022579,
      lon: 12.486716)
  ]
}
