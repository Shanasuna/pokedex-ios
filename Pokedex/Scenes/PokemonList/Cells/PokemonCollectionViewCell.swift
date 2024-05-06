//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 6/5/2567 BE.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var pokemonImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func display(viewModel: PokemonList.DisplayPokemon) {
    pokemonImageView.setImage(url: viewModel.imageUrl)
    nameLabel.text = viewModel.name
  }
  
}
