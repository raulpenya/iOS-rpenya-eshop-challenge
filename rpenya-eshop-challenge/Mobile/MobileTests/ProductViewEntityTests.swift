//
//  ProductViewEntityTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ProductViewEntityTests: XCTestCase {
    func test_transformToUI() {
        //Given
        let product = MockProduct.givenProduct1()
        //When
        let productViewEntity = product.transformToUI()
        //Then
        XCTAssertEqual(product.code, productViewEntity.code)
        XCTAssertEqual(product.name, productViewEntity.name)
        XCTAssertEqual(product.price, productViewEntity.price)
        XCTAssertEqual(product.currency, productViewEntity.currency)
    }
    
    func test_equatable_true() {
        //Given
        let product1 = MockProductViewEntity.givenProduct1()
        let product2 = MockProductViewEntity.givenProduct1()
        //When
        let result = product1 == product2
        //Then
        XCTAssertTrue(result)
    }
    
    func test_equatable_false() {
        //Given
        let product1 = MockProductViewEntity.givenProduct1()
        let product2 = MockProductViewEntity.givenProduct2()
        //When
        let result = product1 == product2
        //Then
        XCTAssertFalse(result)
    }
    
    func test_getPriceString() {
        //Given
        let product1 = MockProductViewEntity.givenProduct1()
        //When
        let price = product1.getPriceString()
        //Then
        XCTAssertEqual(price, "20.00€/u")
    }
}
