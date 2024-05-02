//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 3/5/2567 BE.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
  
  @IBOutlet weak var pokemonImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var lineView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
