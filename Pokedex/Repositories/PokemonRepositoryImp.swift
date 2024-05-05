//
//  PokemonRepositoryImp.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation
import Alamofire

class PokemonRepositoryImp: PokemonRepository {
  
  func getPokemons(linkUrl: String?, limit: Int) async -> DataResponse<PagingResponse<Pokemon>, AFError> {
    let url = linkUrl ?? "\(ServiceURLs.BASE_URL)/pokemon?limit=\(limit)"
    
    return await withCheckedContinuation { continuation in
      AF.request(url).responseDecodable { (response: DataResponse<PagingResponse<Pokemon>, AFError>) in
        continuation.resume(returning: response)
      }
    }
  }
  
  func getPokemonInfo(linkUrl: String) async -> DataResponse<Pokemon, AFError> {
    return await withCheckedContinuation { continuation in
      AF.request(linkUrl).responseDecodable { (response: DataResponse<Pokemon, AFError>) in
        continuation.resume(returning: response)
      }
    }
  }
  
}
