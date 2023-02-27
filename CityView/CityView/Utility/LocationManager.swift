//
//  LocationManager.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-28.
//

import Foundation
import CoreLocation
import CoreLocationUI
import MapKit

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
  private let manager = CLLocationManager()
  
  @Published var location: CLLocationCoordinate2D?
  
  @Published var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 42.0422448, longitude: -102.0079053),
    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
  )
  
  override init() {
    super.init()
    manager.delegate = self
  }
  
  func requestLocation() {
    manager.requestLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    
    DispatchQueue.main.async {
      self.location = location.coordinate
      self.region = MKCoordinateRegion(
        center: location.coordinate,
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
      )
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
}
