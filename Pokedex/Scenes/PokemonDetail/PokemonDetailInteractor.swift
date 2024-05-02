//
//  PokemonDetailInteractor.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailBusinessLogic {
  
}

protocol PokemonDetailDataStore {
  
}

class PokemonDetailInteractor: PokemonDetailDataStore {
  
  // MARK: - Properties
  var presenter: PokemonDetailPresentationLogic?
  
}

extension PokemonDetailInteractor: PokemonDetailBusinessLogic {
  
}
