//
//  CityViewApp.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-27.
//

import SwiftUI

@main
struct CityViewApp: App {
  // MARK: - Property
  @MainActor @StateObject private var monitor = NetworkMonitor()
  // MARK: - Body
  var body: some Scene {
    WindowGroup {
      if !monitor.isActive {
        VStack {
          Spacer()
          Text(Constants.String.noNetwork)
            .font(.footnote)
            .fontWeight(.bold)
            .padding()
          Spacer()
        } //: VStack
      } else {
        ContentView()
          .environmentObject(monitor)
      }
    }
  }
}
