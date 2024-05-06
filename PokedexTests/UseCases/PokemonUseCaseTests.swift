//
//  PokemonUseCaseTests.swift
//  PokedexTests
//
//  Created by Warakorn Chanprasopchai on 6/5/2567 BE.
//

import XCTest
import Swinject
@testable import Pokedex

final class PokemonUseCaseTests: XCTestCase {
  
  let useCase = container.resolve(PokemonUseCaseDependencies.self)!
  
  func testGetPokemons() async throws {
    let limit = 9
    let pokemons = await useCase.getPokemons(linkUrl: nil, limit: limit)
    XCTAssert(pokemons.count == limit)
  }
  
  func testSearchPokemons() async throws {
    let limit = 9
    let pokemons = await useCase.getPokemons(linkUrl: nil, limit: limit)
    
    let keyword = "Char"
    
    let result = useCase.searchPokemon(pokemons: pokemons, keyword: keyword)
    result.forEach { pokemon in
      XCTAssertTrue(pokemon.name?.lowercased().contains(keyword.lowercased()) ?? false)
    }
  }
  
  func testGetPokemonInfo() async throws {
    let url = "https://pokeapi.co/api/v2/pokemon/6"
    let pokemon = await useCase.getPokemonInfo(linkUrl: url)
    
    XCTAssertNotNil(pokemon)
    XCTAssertEqual(pokemon?.name, "charizard")
  }
  
}
