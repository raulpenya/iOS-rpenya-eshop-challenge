//
//  ProductsRemoveDuplicatesTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 7/3/23.
//

import XCTest

final class ProductsRemoveDuplicatesTests: XCTestCase {
    func test_removeDuplicates_withDuplicates() {
        //Given
        let productsWithDuplicates = MockProducts.givenProducts()
        //When
        let finalProducts = productsWithDuplicates.removeDuplicates()
        //Then
        XCTAssertTrue(productsWithDuplicates.products.count > finalProducts.products.count)
        XCTAssertEqual(productsWithDuplicates.products.count, 6)
        XCTAssertEqual(finalProducts.products.count, 3)
        XCTAssertEqual(finalProducts.products[0].code, MockProduct.code1)
        XCTAssertEqual(finalProducts.products[1].code, MockProduct.code2)
        XCTAssertEqual(finalProducts.products[2].code, MockProduct.code3)
    }

    func test_removeDuplicates_withoutDuplicates() {
        
    }
}
