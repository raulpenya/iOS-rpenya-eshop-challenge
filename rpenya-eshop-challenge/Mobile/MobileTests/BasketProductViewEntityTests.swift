//
//  BasketProductViewEntityTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class BasketProductViewEntityTests: XCTestCase {
    func test_transformToProductList() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1()
        //When
        let item = basketProduct.transformToProductListItem(view: .productsList, action: action)
        //Then
        XCTAssertEqual(item.basketProduct.product, basketProduct.product)
        XCTAssertEqual(item.view, .productsList)
    }

    func test_transformToBasketProduct() {
        //Given
        let product = MockProduct.givenProduct1()
        //When
        let basketProduct = product.transformToBasketProduct()
        //Then
        XCTAssertEqual(basketProduct.product, product.transformToUI())
        XCTAssertEqual(basketProduct.units, 0)
    }
    
    func test_equatable_true() {
        //Given
        let basketProduct1 = MockBasketProductViewEntity.givenBasketProduct1()
        let basketProduct2 = MockBasketProductViewEntity.givenBasketProduct1()
        //When
        let result = basketProduct1 == basketProduct2
        //Then
        XCTAssertTrue(result)
    }
    
    func test_equatable_false() {
        //Given
        let basketProduct1 = MockBasketProductViewEntity.givenBasketProduct1()
        let basketProduct2 = MockBasketProductViewEntity.givenBasketProduct2()
        //When
        let result = basketProduct1 == basketProduct2
        //Then
        XCTAssertFalse(result)
    }
    
    func action(item: ProductListItem, action: ProductListItemAction) { }
}
