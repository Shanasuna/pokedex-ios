//
//  PokemonRepositoryDependencies.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation
import Alamofire

protocol PokemonRepositoryDependencies {
  func getPokemons(linkUrl: String?, limit: Int) async -> DataResponse<PagingResponse<Pokemon>, AFError>
  func getPokemonInfo(linkUrl: String) async -> DataResponse<Pokemon, AFError>
}
