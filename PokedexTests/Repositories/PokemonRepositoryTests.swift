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
