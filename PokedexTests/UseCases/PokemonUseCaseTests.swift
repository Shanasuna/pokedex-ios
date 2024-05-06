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
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Any test you write for XCTest can be annotated as throws and async.
    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
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
