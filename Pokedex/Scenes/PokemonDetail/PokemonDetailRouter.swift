//
//  PokemonDetailRouter.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailRoutingLogic {
  func back()
}

protocol PokemonDetailDataPassing {
  var dataStore: PokemonDetailDataStore? { get }
}

class PokemonDetailRouter: NSObject, PokemonDetailDataPassing {
  
  class func newInstance(linkUrl: String) -> PokemonDetailViewController {
    let viewController = PokemonDetailViewController(nibName: String(describing: PokemonDetailViewController.self), bundle: nil)
    let interactor = PokemonDetailInteractor(pokemonUseCase: PokemonUseCaseImp(pokemonRepository: PokemonRepositoryImp()))
    let presenter = PokemonDetailPresenter()
    let router = PokemonDetailRouter()
    
    viewController.interactor = interactor
    viewController.router = router
    
    interactor.presenter = presenter
    
    presenter.viewController = viewController
    
    router.viewController = viewController
    router.dataStore = interactor
    
    router.dataStore?.linkUrl = linkUrl
    
    return viewController
  }
  
  // MARK: - Properties
  private weak var viewController: PokemonDetailViewController?
  
  var dataStore: PokemonDetailDataStore?
  
}

extension PokemonDetailRouter: PokemonDetailRoutingLogic {
  
  func back() {
    viewController?.dismissOrPop()
  }
  
}
