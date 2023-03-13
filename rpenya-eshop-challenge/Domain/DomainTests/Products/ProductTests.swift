//
//  ProductTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 7/3/23.
//

import XCTest
@testable import Domain

final class ProductTests: XCTestCase {
    func test_addPromotion() {
        //Given
        let product = MockProduct.givenProduct1()
        let promotion = MockPromotion.givenPromotion1()
        //When
        let productResult = product.addPromotion(promotion)
        //Then
        XCTAssertEqual(product.code, productResult.code)
        XCTAssertEqual(product.name, productResult.name)
        XCTAssertEqual(product.price, productResult.price)
        XCTAssertEqual(product.code, productResult.promotion?.productCode)
    }
}
