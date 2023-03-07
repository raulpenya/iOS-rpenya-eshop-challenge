//
//  ProductsTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 7/3/23.
//

import XCTest
@testable import Domain

final class ProductsTests: XCTestCase {
    func test_linkPromotions() {
        //Given
        let products = MockProducts.givenProducts(duplicates: false)
        let promotions = MockPromotions.givenPromotions(duplicates: false)
        //When
        let productsResult = products.linkPromotions(promotions)
        //Then
        XCTAssertEqual(productsResult.products.count, productsResult.products.count)
        XCTAssertEqual(productsResult.products[0].promotion!.productCode, promotions.promotions[0].productCode)
        XCTAssertEqual(productsResult.products[1].promotion!.productCode, promotions.promotions[1].productCode)
        XCTAssertNil(productsResult.products[2].promotion)
    }
}
