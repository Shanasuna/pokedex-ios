//
//  PokemonDetailInteractor.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailBusinessLogic {
  func getInfo(request: PokemonDetail.GetInfo.Request)
}

protocol PokemonDetailDataStore {
  var linkUrl: String? { get set }
}

class PokemonDetailInteractor: PokemonDetailDataStore {
  
  // MARK: - Properties
  var presenter: PokemonDetailPresentationLogic?
  
  private let pokemonUseCase: PokemonUseCase
  
  init(pokemonUseCase: PokemonUseCase) {
    self.pokemonUseCase = pokemonUseCase
  }
  
  var linkUrl: String?
  
}

extension PokemonDetailInteractor: PokemonDetailBusinessLogic {
  
  func getInfo(request: PokemonDetail.GetInfo.Request) {
    Task {
      guard let linkUrl = self.linkUrl, let pokemon = await pokemonUseCase.getPokemonInfo(linkUrl: linkUrl) else {
        DispatchQueue.main.async { [weak self] in
          self?.presenter?.presentError(error: CustomError.reason("Cannot get pokemon info"))
        }
        return
      }
      
      DispatchQueue.main.async { [weak self] in
        self?.presenter?.presentGetInfo(response: .init(pokemon: pokemon))
      }
    }
  }
  
}
