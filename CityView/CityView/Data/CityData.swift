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
      lon: 18.005875,
      points: "17.9779182318844 59.3132998942194,18.004878760587 59.3189023042663,18.0279379939835 59.3136485446068"
    ),
    City(
      name: "Milan",
      lat: 45.4837341,
      lon: 9.1843982,
      points: "9.151553894506 45.4896126447163,9.143564121793 45.4841168002611,9.14322299156504 45.4795484622198"
    ),
    City(
      name: "Barcelona",
      lat: 41.4052974,
      lon: 2.165195,
      points: "2.18397021150421 41.4249504296059,2.19613439904907 41.4271141741846,2.19308425642669 41.4440623835393"
    ),
    City(
      name: "Berlin",
      lat: 52.507096,
      lon: 13.3826695,
      points: "13.41250419616699 52.55401993319128,13.41198921203613 52.55579422772695,13.40778350830078 52.5563682488"
    ),
    City(
      name: "Rome",
      lat: 41.9022579,
      lon: 12.486716,
      points: "12.4818161828914 41.8647300999383,12.4796144531088 41.8653790779984,12.4803749443069 41.8702258796603")
  ]
}
