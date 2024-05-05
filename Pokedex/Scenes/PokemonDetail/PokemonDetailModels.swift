//
//  PokemonDetailModels.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

enum PokemonDetail {
  
  struct DisplayPokemon {
    let imageUrl: String
    let name: String
    let weight: String
    let height: String
    let types: String
    let abilities: String
  }
  
  enum GetInfo {
    
    struct Request {
      
    }
    
    struct Response {
      let pokemon: Pokemon
    }
    
    struct ViewModel {
      let pokemon: DisplayPokemon
    }
    
  }
  
}
