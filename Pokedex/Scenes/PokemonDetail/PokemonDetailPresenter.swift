//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

protocol PokemonDetailPresentationLogic {
  func presentError(error: Error)
}

class PokemonDetailPresenter {

  // MARK: - Properties
  weak var viewController: PokemonDetailDisplayLogic?
  
}

extension PokemonDetailPresenter: PokemonDetailPresentationLogic {
  
  func presentError(error: Error) {
    viewController?.displayError(error: error, handler: nil)
  }
  
}
