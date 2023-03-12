//
//  ShoppingBasketListItemTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 11/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ShoppingBasketListItemTests: XCTestCase {
    func test_getters() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1()
        let item = ShoppingBasketListItem(basketProduct: basketProduct, view: .shoppingBasket)
        //When
        let title = item.getTitle()
        let subtitle = item.getSubtitle()
        let units = item.getUnits()
        let price = item.getPrice()
        let amount = item.getAmount()
        let discountAmount = item.getDiscountAmount()
        //Then
        XCTAssertEqual(title, item.basketProduct.product.name)
        XCTAssertEqual(subtitle, item.basketProduct.product.promotion?.name)
        XCTAssertEqual(units, String(item.basketProduct.units))
        XCTAssertEqual(price, "20.00€/u")
        XCTAssertEqual(amount, basketProduct.getAmountWithDiscountString())
        XCTAssertEqual(discountAmount, basketProduct.getDiscountAmountSting())
    }
    
    func test_getters_nodiscount() {
        //Given
        let basketProduct =
        BasketProductViewEntity(product: MockProductViewEntity.givenProduct1(promotion: nil), units: 3)
        let item = ShoppingBasketListItem(basketProduct: basketProduct, view: .shoppingBasket)
        //When
        let subtitle = item.getSubtitle()
        let discountAmount = item.getDiscountAmount()
        //Then
        XCTAssertNil(subtitle)
        XCTAssertNil(discountAmount)
    }
    
    func test_equatable_true() {
        //Given
        let item1 = MockProductsListItem.givenProductsListItem1()
        let item2 = MockProductsListItem.givenProductsListItem1()
        //When
        let result = item1 == item2
        //Then
        XCTAssertTrue(result)
    }
    
    func test_equatable_false() {
        //Given
        let item1 = MockProductsListItem.givenProductsListItem1()
        let item2 = MockProductsListItem.givenProductsListItem2()
        //When
        let result = item1 == item2
        //Then
        XCTAssertFalse(result)
    }
}
