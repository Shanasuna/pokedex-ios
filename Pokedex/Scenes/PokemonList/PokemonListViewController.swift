//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonListDisplayLogic: BaseDisplayLogic {
  func displayGetPokemons(viewModel: PokemonList.GetPokemons.ViewModel)
  func displaySearchPokemons(viewModel: PokemonList.SearchPokemons.ViewModel)
}

class PokemonListViewController: BaseViewController {
  
  // MARK: - Static Properties
  
  // MARK: - IBOutlet Properties
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Properties
  var interactor: PokemonListBusinessLogic?
  var router: (NSObjectProtocol & PokemonListRoutingLogic & PokemonListDataPassing)?
  
  var pokemons: [PokemonList.DisplayPokemon] = []
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
    displayLoadingHUD()
    getPokemons()
  }
  
  // MARK: - Functions
  func setupView() {
    title = "Pokedex"
    
    searchBar.delegate = self
    
    tableView.register(R.nib.pokemonTableViewCell)
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  private func getPokemons() {
    interactor?.getPokemons(request: .init(forceReload: true))
  }
  
  // MARK: - Actions
  
}

// MARK: - Display Logic
extension PokemonListViewController: PokemonListDisplayLogic {
  
  func displayGetPokemons(viewModel: PokemonList.GetPokemons.ViewModel) {
    dismissLoadingHUD()
    
    pokemons = viewModel.pokemons
    tableView.reloadData()
  }
  
  func displaySearchPokemons(viewModel: PokemonList.SearchPokemons.ViewModel) {
    dismissLoadingHUD()
    
    pokemons = viewModel.pokemons
    tableView.reloadData()
  }
  
}

// MARK: - TableView DataSource & Delegate
extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pokemons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.pokemonTableViewCell, for: indexPath)!
    
    if let pokemon = pokemons[safe: indexPath.row] {
      cell.display(viewModel: pokemon)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let linkUrl = pokemons[safe: indexPath.row]?.linkUrl else { return }
    router?.routeToDetail(linkUrl: linkUrl)
  }
  
}

// MARK: - TableView DataSource & Delegate
extension PokemonListViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    interactor?.searchPokemons(request: .init(keyword: searchText))
  }
  
}
