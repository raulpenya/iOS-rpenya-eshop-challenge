//
//  BasketViewEntityTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class BasketViewEntityTests: XCTestCase {
    func test_transformToProductsList() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        //When
        let productsList = basket.transformToProductsList(action: action)
        //Then
        XCTAssertEqual(basket.products[0].product, (productsList.items[0].item as! ProductsListItem).basketProduct.product)
        XCTAssertEqual(basket.products[0].units, (productsList.items[0].item as! ProductsListItem).basketProduct.units)
    }
    
    func test_transformToBasket() {
        //Given
        let products = MockProducts.givenProducts(duplicates: false)
        //When
        let basket = products.transformToBasket()
        //Then
        XCTAssertEqual(basket.products.count, products.products.count)
    }
    
    func action(item: ProductsListItem, action: ProductsListItemAction) { }
}
