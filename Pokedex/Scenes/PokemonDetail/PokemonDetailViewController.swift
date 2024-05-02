//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailDisplayLogic: BaseDisplayLogic {
  
}

class PokemonDetailViewController: BaseViewController {
  
  // MARK: - Static Properties
  
  // MARK: - IBOutlet Properties
  
  // MARK: - Properties
  var interactor: PokemonDetailBusinessLogic?
  var router: (NSObjectProtocol & PokemonDetailRoutingLogic & PokemonDetailDataPassing)?
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  // MARK: - Functions
  func setupView() {
    
  }
  
  // MARK: - Actions
  
}

// MARK: - Display Logic
extension PokemonDetailViewController: PokemonDetailDisplayLogic {
  
}
