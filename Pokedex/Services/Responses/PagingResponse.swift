//
//  PagingResponse.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation

class PagingResponse<T: Codable>: Codable {
  
  var count: Int?
  var next: String?
  var previous: String?
  var results: [T]?
  
}
