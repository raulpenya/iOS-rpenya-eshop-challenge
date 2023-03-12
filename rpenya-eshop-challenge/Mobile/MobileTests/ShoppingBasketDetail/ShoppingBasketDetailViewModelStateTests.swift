//
//  ShoppingBasketDetailViewModelStateTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 11/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ShoppingBasketDetailViewModelStateTests: XCTestCase {
    func test_init_state() {
        //Given
        let model = ShoppingBasketDetailViewModel(currentShoppingBasket: MockShoppingBasketViewEntity.givenShoppingBasket(), delegate: MockShoppingBasketDetailDelegate())
        //When
        let state = model.state
        //Then
        XCTAssertEqual(state, .idle)
    }
    
    func test_updateView_state() {
        //Given
        let shoppingBasket = MockShoppingBasketViewEntity.givenShoppingBasket()
        let model = ShoppingBasketDetailViewModel(currentShoppingBasket: shoppingBasket, delegate: MockShoppingBasketDetailDelegate())
        //When
        model.updateView(with: shoppingBasket)
        //Then
        XCTAssertEqual(model.state, .loaded(shoppingBasket.transformToShoppingBasketList(), shoppingBasket.transformToProductListButtonItem(action: model.checkoutButtonPressed)))
    }
}
