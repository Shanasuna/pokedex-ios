//
//  ServiceURLs.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation

class ServiceURLs {
  
  static var BASE_URL: String = "https://pokeapi.co/api/v2"
  
  static func POKEMON_IMAGE_URL(pokemonId: Int) -> String {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonId).png"
  }
  
}
