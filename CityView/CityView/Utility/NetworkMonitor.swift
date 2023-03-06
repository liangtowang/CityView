//
//  NetworkMonitor.swift
//  CityView
//
//  Created by Liang Wang on 2023-03-06.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
  private var monitor = NWPathMonitor()
  private let queue = DispatchQueue(label: "NetworkMonitorQueue")

  var isActive = false
  var isExpensive = false
  var isConstrained = false
  var connectionType = NWInterface.InterfaceType.other

  init() {
    monitor.pathUpdateHandler = { path in
      self.isActive = path.status == .satisfied

      DispatchQueue.main.async {
        self.objectWillChange.send()
      }
    }
    monitor.start(queue: queue)
  }
}
