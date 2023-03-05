//
//  ProductRemoteEntityMapperTests.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import XCTest
@testable import Data
import Domain

final class ProductRemoteEntityMapperTests: XCTestCase {
    func tests_ProductRemoteEntity_transform() {
        //Given
        let product = MockProductRemoteEntity.givenProduct()
        //When
        let domainProduct = product.transformToDomain()
        //Then
        XCTAssertEqual(product.code, domainProduct.code)
        XCTAssertEqual(product.name, domainProduct.name)
        XCTAssertEqual(product.price, domainProduct.price)
    }
}
