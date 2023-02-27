//
//  NetworkService.swift
//  CityView
//
//  Created by Liang Wang on 2023-02-28.
//

import Foundation

struct NetworkService {
  // MARK: - NetworkServiceError
  enum NetworkServiceError: Error {
    case couldNotCreateURL
    case invalidResponse
    case couldNotDecodeData
  }
  
  // MARK: - LoadData
  func loadData() async throws -> [City] {
    guard let url = URL(string: Constants.General.urlString) else {
      throw NetworkServiceError.couldNotCreateURL
    }
    
    // get data
    let configuration = URLSessionConfiguration.default
    let session = URLSession(configuration: configuration)
    
    let (data, response) = try await session.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode)
    else {
      throw NetworkServiceError.invalidResponse
    }
    
    do {
      // decode data
      return try JSONDecoder().decode(Response.self, from: data).cities
    } catch {
      throw NetworkServiceError.couldNotDecodeData
    }
  }
}
