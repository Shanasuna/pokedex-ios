//
//  CustomError.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation

enum CustomError: Error {
  case unknown
  case invalidToken
  case notLoggedIn
  case reason(String)
}

extension CustomError: LocalizedError {
  
  public var errorDescription: String? {
    switch self {
    case .unknown:
      return "Unknown error"
      
    case .invalidToken:
      return "Invalid token"
      
    case .notLoggedIn:
      return "Not logged in"

    case .reason(let reason):
      return reason
    }
  }
  
}

extension CustomError: Equatable {
  
}
