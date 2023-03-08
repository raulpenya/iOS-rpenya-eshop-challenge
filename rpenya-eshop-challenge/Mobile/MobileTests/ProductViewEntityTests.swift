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
}
