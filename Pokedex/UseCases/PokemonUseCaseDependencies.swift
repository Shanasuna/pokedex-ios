//
//  PokemonUseCaseDependencies.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation

protocol PokemonUseCaseDependencies {
  func getPokemons(linkUrl: String?, limit: Int) async -> [Pokemon]
  func searchPokemon(pokemons: [Pokemon], keyword: String) -> [Pokemon]
  func getPokemonInfo(linkUrl: String) async -> Pokemon?
}
