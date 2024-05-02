//
//  PokemonListRouter.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonListRoutingLogic {
  func back()
}

protocol PokemonListDataPassing {
  var dataStore: PokemonListDataStore? { get }
}

class PokemonListRouter: NSObject, PokemonListDataPassing {
  
  class func newInstance() -> PokemonListViewController {
    let viewController = PokemonListViewController(nibName: String(describing: PokemonListViewController.self), bundle: nil)
    let interactor = PokemonListInteractor()
    let presenter = PokemonListPresenter()
    let router = PokemonListRouter()
    
    viewController.interactor = interactor
    viewController.router = router
    
    interactor.presenter = presenter
    
    presenter.viewController = viewController
    
    router.viewController = viewController
    router.dataStore = interactor
    
    // router.dataStore?.something = something
    
    return viewController
  }
  
  // MARK: - Properties
  private weak var viewController: PokemonListViewController?
  
  var dataStore: PokemonListDataStore?
  
}

extension PokemonListRouter: PokemonListRoutingLogic {
  
  func back() {
    viewController?.dismissOrPop()
  }
  
}
