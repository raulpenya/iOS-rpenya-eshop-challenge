//
//  ProductListItemTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ProductListItemTests: XCTestCase {
    func test_getters() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1()
        let item = ProductListItem(basketProduct: basketProduct, view: .productsList, action: nil)
        //When
        let title = item.getTitle()
        let subtitle = item.getSubtitle()
        let units = item.getUnits()
        //Then
        XCTAssertEqual(title, item.basketProduct.product.name)
        XCTAssertEqual(subtitle, item.basketProduct.product.promotion?.name)
        XCTAssertEqual(units, String(item.basketProduct.units))
    }
    
    func test_equatable_true() {
        //Given
        let item1 = MockProductListItem.givenProductListItem1()
        let item2 = MockProductListItem.givenProductListItem1()
        //When
        let result = item1 == item2
        //Then
        XCTAssertTrue(result)
    }
    
    func test_equatable_false() {
        //Given
        let item1 = MockProductListItem.givenProductListItem1()
        let item2 = MockProductListItem.givenProductListItem2()
        //When
        let result = item1 == item2
        //Then
        XCTAssertFalse(result)
    }
}
