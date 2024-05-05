//
//  Pokemon.swift
//  Pokedex
//
//  Created by Warakorn Chanprasopchai on 4/5/2567 BE.
//

import Foundation

struct Pokemon: Codable {
  
  var name: String?
  var url: String?
  var weight: Int?
  var height: Int?
  var sprites: PokemonSprite?
  var types: [PokemonType]?
  var abilities: [PokemonAbilities]?
  
}

struct PokemonDataObject: Codable {
  var name: String?
  var url: String?
}

struct PokemonType: Codable {
  var type: PokemonDataObject?
}

struct PokemonAbilities: Codable {
  var ability: PokemonDataObject?
}

struct PokemonTypeSlot: Codable {
  var type: PokemonDataObject?
}

struct PokemonSprite: Codable {
  var front_default: String?
}
