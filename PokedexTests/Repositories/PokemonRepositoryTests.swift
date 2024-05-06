//
//  PokemonRepositoryTests.swift
//  PokedexTests
//
//  Created by Warakorn Chanprasopchai on 6/5/2567 BE.
//

import XCTest
import Swinject
@testable import Pokedex

final class PokemonRepositoryTests: XCTestCase {
  
  let repository = container.resolve(PokemonRepositoryDependencies.self)!
  
  func testGetPokemons() async throws {
    let limit = 9
    let response = await repository.getPokemons(linkUrl: nil, limit: limit)
    
    XCTAssertNil(response.error)
    XCTAssertNotNil(response.value)
    XCTAssert(response.value?.results?.count == limit)
  }
  
  func testGetPokemonInfo() async throws {
    let url = "https://pokeapi.co/api/v2/pokemon/6"
    let response = await repository.getPokemonInfo(linkUrl: url)
    
    XCTAssertNil(response.error)
    XCTAssertNotNil(response.value)
    XCTAssertEqual(response.value?.name, "charizard")
  }
  
}
