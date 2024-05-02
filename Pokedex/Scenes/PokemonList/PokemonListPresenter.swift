//
//  PokemonListPresenter.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

protocol PokemonListPresentationLogic {
  func presentError(error: Error)
}

class PokemonListPresenter {

  // MARK: - Properties
  weak var viewController: PokemonListDisplayLogic?
  
}

extension PokemonListPresenter: PokemonListPresentationLogic {
  
  func presentError(error: Error) {
    viewController?.displayError(error: error, handler: nil)
  }
  
}
