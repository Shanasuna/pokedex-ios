//
//  PokemonListInteractor.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonListBusinessLogic {
  
}

protocol PokemonListDataStore {
  
}

class PokemonListInteractor: PokemonListDataStore {
  
  // MARK: - Properties
  var presenter: PokemonListPresentationLogic?
  
}

extension PokemonListInteractor: PokemonListBusinessLogic {
  
}
