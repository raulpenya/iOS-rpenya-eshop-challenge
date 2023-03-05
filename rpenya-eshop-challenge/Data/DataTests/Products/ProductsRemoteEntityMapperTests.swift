//
//  ProductsRemoteEntityMapperTests.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import XCTest
@testable import Data

final class ProductsRemoteEntityMapperTests: XCTestCase {
    func tests_ProductsRemoteEntity_transform() {
        //Given
        let products = MockProductsRemoteEntity.givenProducts()
        //When
        let domainProducts = products.transformToDomain()
        //Then
        XCTAssertEqual(products.products.count, domainProducts.count)
        XCTAssertEqual(products.products[0].code, domainProducts[0].code)
        XCTAssertEqual(products.products[0].name, domainProducts[0].name)
        XCTAssertEqual(products.products[0].price, domainProducts[0].price)
    }
}
