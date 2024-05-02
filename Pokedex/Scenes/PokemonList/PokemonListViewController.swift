//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonListDisplayLogic: BaseDisplayLogic {
  
}

class PokemonListViewController: BaseViewController {
  
  // MARK: - Static Properties
  
  // MARK: - IBOutlet Properties
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Properties
  var interactor: PokemonListBusinessLogic?
  var router: (NSObjectProtocol & PokemonListRoutingLogic & PokemonListDataPassing)?
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  // MARK: - Functions
  func setupView() {
    title = "Pokedex"
    
    tableView.register(R.nib.pokemonTableViewCell)
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  // MARK: - Actions
  
}

// MARK: - Display Logic
extension PokemonListViewController: PokemonListDisplayLogic {
  
}

// MARK: - TableView DataSource & Delegate
extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 9
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.pokemonTableViewCell, for: indexPath)!
    
    return cell
  }
  
}
