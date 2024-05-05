//
//  PokemonListPresenter.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol PokemonListPresentationLogic {
  func presentError(error: Error)
  
  func presentGetPokemons(response: PokemonList.GetPokemons.Response)
  func presentSearchPokemons(response: PokemonList.SearchPokemons.Response)
}

class PokemonListPresenter {

  // MARK: - Properties
  weak var viewController: PokemonListDisplayLogic?
  
  private func mapPokemon(pokemon: Pokemon) -> PokemonList.DisplayPokemon {
    let name = pokemon.name?.capitalized ?? ""
    var imageUrl = ""
    let linkUrl = pokemon.url ?? ""
    
    if let linkURL = URL(string: pokemon.url ?? ""), let pokemonId = Int(linkURL.lastPathComponent) {
      imageUrl = ServiceURLs.POKEMON_IMAGE_URL(pokemonId: pokemonId)
    }
    
    return .init(
      name: name,
      imageUrl: imageUrl,
      linkUrl: linkUrl
    )
  }
  
}

extension PokemonListPresenter: PokemonListPresentationLogic {
  
  func presentError(error: Error) {
    viewController?.displayError(error: error, handler: nil)
  }
  
  func presentGetPokemons(response: PokemonList.GetPokemons.Response) {
    viewController?.displayGetPokemons(viewModel: .init(pokemons: response.pokemons.map({ self.mapPokemon(pokemon: $0) })))
  }
  
  func presentSearchPokemons(response: PokemonList.SearchPokemons.Response) {
    viewController?.displaySearchPokemons(viewModel: .init(pokemons: response.pokemons.map({ self.mapPokemon(pokemon: $0) })))
  }
  
}
