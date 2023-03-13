//
//  ProductRemoteEntityTests.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import XCTest
@testable import Data
import Domain

final class ProductRemoteEntityTests: XCTestCase {
    func tests_ProductRemoteEntity_transform() {
        //Given
        let product = MockProductRemoteEntity.givenProduct1()
        //When
        let domainProduct = product.transformToDomain()
        //Then
        XCTAssertNotNil(domainProduct)
        XCTAssertEqual(product.code, domainProduct.code)
        XCTAssertEqual(product.name, domainProduct.name)
        XCTAssertEqual(product.price, domainProduct.price)
    }
    
    func tests_ProductRemoteEntity_equatable_success() {
        //Given
        let product1 = MockProductRemoteEntity.givenProduct1()
        let product2 = MockProductRemoteEntity.givenProduct1()
        //When
        let result = product1 == product2
        //Then
        XCTAssertTrue(result)
    }
    
    func tests_ProductRemoteEntity_equatable_false() {
        //Given
        let product1 = MockProductRemoteEntity.givenProduct1()
        let product2 = MockProductRemoteEntity.givenProduct2()
        //When
        let result = product1 == product2
        //Then
        XCTAssertFalse(result)
    }
}
