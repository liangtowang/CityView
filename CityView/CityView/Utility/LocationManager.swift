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
  
  @Published var authorizationStatus: CLAuthorizationStatus?
  
  @Published var location: CLLocationCoordinate2D?
  
  @Published var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 42.0422448, longitude: -102.0079053),
    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
  )
  
  override init() {
    super.init()
    manager.delegate = self
  }
  
//  func requestLocation() {
//    manager.requestLocation()
//  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    switch manager.authorizationStatus {
      case .authorizedWhenInUse:  // Location services are available.
        // Insert code here of what should happen when Location services are authorized
        authorizationStatus = .authorizedWhenInUse
        manager.requestLocation()
        break
        
      case .restricted:  // Location services currently unavailable.
        // Insert code here of what should happen when Location services are NOT authorized
        authorizationStatus = .restricted
        break
        
      case .denied:  // Location services currently unavailable.
        // Insert code here of what should happen when Location services are NOT authorized
        authorizationStatus = .denied
        break
        
      case .notDetermined:        // Authorization not determined yet.
        authorizationStatus = .notDetermined
        manager.requestWhenInUseAuthorization()
        break
        
      default:
        break
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations.first
    manager.stopUpdatingLocation()
    
    DispatchQueue.main.async {
      self.location = location?.coordinate
      self.region = MKCoordinateRegion(
        center: location!.coordinate,
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
      )
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error.localizedDescription)
  }
}
