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
  let ITEMS_PER_ROW: Int = 3
  let ITEM_SPACING: CGFloat = 8
  
  // MARK: - IBOutlet Properties
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var collectionView: UICollectionView!
  
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
    
    collectionView.register(R.nib.pokemonCollectionViewCell)
    
    collectionView.dataSource = self
    collectionView.delegate = self
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
    collectionView.reloadData()
  }
  
  func displaySearchPokemons(viewModel: PokemonList.SearchPokemons.ViewModel) {
    dismissLoadingHUD()
    
    pokemons = viewModel.pokemons
    collectionView.reloadData()
  }
  
}

// MARK: - Collectioniew DataSource & Delegate
extension PokemonListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: ITEM_SPACING, left: ITEM_SPACING, bottom: ITEM_SPACING, right: ITEM_SPACING)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return ITEM_SPACING
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return ITEM_SPACING
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.width - ((CGFloat(ITEMS_PER_ROW) + 1) * ITEM_SPACING)) / CGFloat(ITEMS_PER_ROW)
    
    print("collectionView.frame.width: \(collectionView.frame.width)")
    print("cell width: \(width)")
    
    return .init(width: width, height: width + 40)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pokemons.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.pokemonCollectionViewCell, for: indexPath)!
    
    if let pokemon = pokemons[safe: indexPath.item] {
      cell.display(viewModel: pokemon)
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let linkUrl = pokemons[safe: indexPath.item]?.linkUrl else { return }
    router?.routeToDetail(linkUrl: linkUrl)
  }
  
}

// MARK: - TableView DataSource & Delegate
extension PokemonListViewController: UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    interactor?.searchPokemons(request: .init(keyword: searchText))
  }
  
}
