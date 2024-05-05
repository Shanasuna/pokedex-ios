//
//  PokemonListInteractor.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonListBusinessLogic {
  func getPokemons(request: PokemonList.GetPokemons.Request)
  func searchPokemons(request: PokemonList.SearchPokemons.Request)
}

protocol PokemonListDataStore {
  
}

class PokemonListInteractor: PokemonListDataStore {
  
  // MARK: - Properties
  var presenter: PokemonListPresentationLogic?
  
  private let pokemonUseCase: PokemonUseCase = container.resolve(PokemonUseCase.self)!
  
  private var pokemons: [Pokemon] = []
  
}

extension PokemonListInteractor: PokemonListBusinessLogic {
  
  func getPokemons(request: PokemonList.GetPokemons.Request) {
    Task {
      let pokemons = await pokemonUseCase.getPokemons(linkUrl: nil, limit: 1000)
      
      self.pokemons = pokemons
      
      DispatchQueue.main.async { [weak self] in
        self?.presenter?.presentGetPokemons(response: .init(pokemons: pokemons))
      }
    }
  }
  
  func searchPokemons(request: PokemonList.SearchPokemons.Request) {
    let result = pokemonUseCase.searchPokemon(pokemons: pokemons, keyword: request.keyword)
    presenter?.presentSearchPokemons(response: .init(pokemons: result))
  }
  
}
