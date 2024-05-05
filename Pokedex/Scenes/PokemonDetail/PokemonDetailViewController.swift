//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailDisplayLogic: BaseDisplayLogic {
  func displayGetInfo(viewModel: PokemonDetail.GetInfo.ViewModel)
}

class PokemonDetailViewController: BaseViewController {
  
  // MARK: - Static Properties
  
  // MARK: - IBOutlet Properties
  @IBOutlet weak var pokemonImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var typesLabel: UILabel!
  @IBOutlet weak var abilitiesLabel: UILabel!
  
  // MARK: - Properties
  var interactor: PokemonDetailBusinessLogic?
  var router: (NSObjectProtocol & PokemonDetailRoutingLogic & PokemonDetailDataPassing)?
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
    displayLoadingHUD()
    getInfo()
  }
  
  // MARK: - Functions
  func setupView() {
    
  }
  
  private func getInfo() {
    interactor?.getInfo(request: .init())
  }
  
  // MARK: - Actions
  
}

// MARK: - Display Logic
extension PokemonDetailViewController: PokemonDetailDisplayLogic {
  
  func displayGetInfo(viewModel: PokemonDetail.GetInfo.ViewModel) {
    dismissLoadingHUD()
    
    let pokemon = viewModel.pokemon
    
    pokemonImageView.setImage(url: pokemon.imageUrl)
    nameLabel.text = pokemon.name
    weightLabel.text = pokemon.weight
    heightLabel.text = pokemon.height
    typesLabel.text = pokemon.types
    abilitiesLabel.text = pokemon.abilities
  }
  
}
