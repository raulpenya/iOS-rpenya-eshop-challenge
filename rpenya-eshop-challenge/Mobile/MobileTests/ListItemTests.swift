//
//  ListItemTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ListItemTests: XCTestCase {
    func test_transformToAnyItem() {
        //Given
        let item1 = MockProductsListItem.givenProductsListItem1()
        //When
        let anyItem = item1.transformToAnyItem()
        //Then
        XCTAssertEqual((anyItem.item as! ProductsListItem).basketProduct, item1.basketProduct)
        XCTAssertEqual((anyItem.item as! ProductsListItem).view, item1.view)
    }
}
