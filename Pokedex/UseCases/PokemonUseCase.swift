//
//  PokemonUseCase.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation

class PokemonUseCase: PokemonUseCaseDependencies {
  
  var pokemonRepository: PokemonRepositoryDependencies
  
  init(pokemonRepository: PokemonRepositoryDependencies) {
      self.pokemonRepository = pokemonRepository
  }
  
  func getPokemons(linkUrl: String?, limit: Int) async -> [Pokemon] {
    let response = await pokemonRepository.getPokemons(linkUrl: linkUrl, limit: limit)
    let pokemons = response.value?.results ?? []
    
    return pokemons
  }
  
  func searchPokemon(pokemons: [Pokemon], keyword: String) -> [Pokemon] {
    if keyword.isEmpty {
      return pokemons
    } else {
      let pokemons = pokemons.filter { pokemon in
        (pokemon.name?.lowercased() ?? "").contains(keyword.lowercased())
      }
      
      return pokemons
    }
  }
  
  func getPokemonInfo(linkUrl: String) async -> Pokemon? {
    return await pokemonRepository.getPokemonInfo(linkUrl: linkUrl).value
  }
  
}
