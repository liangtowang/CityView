//
//  Constant.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import Foundation

enum Constants {

  enum General {
    public static let appName = "CityView"
    public static let spacing = CGFloat(10.0)
    public static let zero = 0.0
  }

  enum String {
    public static let urlString = "https://pgroute-staging.easyparksystem.net/cities"

    public static let yourLocation = "Current location is:"
    public static let latitude = "Latitude: "
    public static let longitude = "Longitude: "

    public static let restritedOrDenied = "Current location data was restricted or denied."
    public static let findLocation = "Finding your location..."
  }
}
