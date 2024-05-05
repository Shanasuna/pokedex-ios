//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

protocol PokemonDetailPresentationLogic {
  func presentError(error: Error)
  
  func presentGetInfo(response: PokemonDetail.GetInfo.Response)
}

class PokemonDetailPresenter {

  // MARK: - Properties
  weak var viewController: PokemonDetailDisplayLogic?
  
}

extension PokemonDetailPresenter: PokemonDetailPresentationLogic {
  
  func presentError(error: Error) {
    viewController?.displayError(error: error, handler: nil)
  }
  
  func presentGetInfo(response: PokemonDetail.GetInfo.Response) {
    let pokemon = response.pokemon
    
    let imageUrl = pokemon.sprites?.front_default ?? ""
    let name = pokemon.name?.capitalized ?? ""
    let weight = "\(pokemon.weight ?? 0)"
    let height = "\(pokemon.height ?? 0)"
    let types = pokemon.types?.map { $0.type?.name?.capitalized ?? "" }.joined(separator: ", ") ?? ""
    let abilities = pokemon.abilities?.map { $0.ability?.name?.capitalized ?? "" }.joined(separator: ", ") ?? ""
    
    viewController?.displayGetInfo(
      viewModel: .init(
        pokemon: .init(
          imageUrl: imageUrl,
          name: name,
          weight: weight,
          height: height,
          types: types,
          abilities: abilities
        )
      )
    )
  }
  
}
