//
//  PokemonListModels.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

enum PokemonList {
  
  struct DisplayPokemon {
    let name: String
    let imageUrl: String
    let linkUrl: String
  }
  
  enum GetPokemons {
    
    struct Request {
      let forceReload: Bool
    }
    
    struct Response {
      let pokemons: [Pokemon]
    }
    
    struct ViewModel {
      let pokemons: [DisplayPokemon]
    }
    
  }
  
  enum SearchPokemons {
    
    struct Request {
      let keyword: String
    }
    
    struct Response {
      let pokemons: [Pokemon]
    }
    
    struct ViewModel {
      let pokemons: [DisplayPokemon]
    }
    
  }
  
}
