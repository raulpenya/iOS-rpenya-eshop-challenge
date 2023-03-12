//
//  ProductsListItemTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ProductsListItemTests: XCTestCase {
    func test_getters() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1()
        let item = ProductsListItem(basketProduct: basketProduct, view: .productsList) { _,_ in }
        //When
        let title = item.getTitle()
        let subtitle = item.getSubtitle()
        let units = item.getUnits()
        let price = item.getPrice()
        //Then
        XCTAssertEqual(title, item.basketProduct.product.name)
        XCTAssertEqual(subtitle, item.basketProduct.product.promotion?.name)
        XCTAssertEqual(units, String(item.basketProduct.units))
        XCTAssertEqual(price, "20.00€/u")
    }
    
    func test_equatable_true() {
        //Given
        let item1 = MockShoppingBasketListItem.givenShoppingBasketListItem1()
        let item2 = MockShoppingBasketListItem.givenShoppingBasketListItem1()
        //When
        let result = item1 == item2
        //Then
        XCTAssertTrue(result)
    }
    
    func test_equatable_false() {
        //Given
        let item1 = MockShoppingBasketListItem.givenShoppingBasketListItem1()
        let item2 = MockShoppingBasketListItem.givenShoppingBasketListItem2()
        //When
        let result = item1 == item2
        //Then
        XCTAssertFalse(result)
    }
}
