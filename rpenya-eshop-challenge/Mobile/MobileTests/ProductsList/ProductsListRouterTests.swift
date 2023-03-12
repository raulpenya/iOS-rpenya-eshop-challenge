//
//  ProductsListRouterTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 11/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ProductsListRouterTests: XCTestCase {
    func test_destination() {
        //Given
        let router = ProductsListRouter()
        let dependencies = ShoppingBasketDetailDependencies(shoppingBasket: MockShoppingBasketViewEntity.givenShoppingBasket(), delegate: MockProductsListViewModel.getModel())
        //When
        let destination = router.destination(dependencies)
        //Then
        XCTAssertNotNil(destination)
    }
}
