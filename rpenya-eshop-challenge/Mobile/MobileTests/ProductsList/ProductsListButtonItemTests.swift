//
//  ProductsListButtonItemTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 10/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ProductsListButtonItemTests: XCTestCase {
    func test_getTitle() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        let item = basket.transformToProductListButtonItem(action: buttonAction)
        //When
        let attributedString = item.getTitle()
        //Then
        XCTAssertNotNil(attributedString.range(of: basket.getBasketPriceWithoutDiscountString()!))
        XCTAssertNotNil(attributedString.range(of: basket.getBasketPriceWithDiscountString()!))
    }
    
    func test_getTitle_withoutPrice() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 0)
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        let item = basket.transformToProductListButtonItem(action: buttonAction)
        //When
        let attributedString = item.getTitle()
        //Then
        XCTAssertNil(basket.getBasketPriceWithoutDiscountString())
        XCTAssertNil(basket.getBasketPriceWithDiscountString())
        XCTAssertEqual(attributedString, item.getAttributedString(with: item.title))
    }
    
    func test_getTitle_withoutDiscount() {
        //Given
        let product = MockProductViewEntity.givenProduct1(promotion: nil)
        let basketProduct = BasketProductViewEntity(product: product, units: 3)
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        let item = basket.transformToProductListButtonItem(action: buttonAction)
        //When
        let attributedString = item.getTitle()
        //Then
        XCTAssertEqual(basket.getBasketPriceWithoutDiscountString(), basket.getBasketPriceWithDiscountString())
        XCTAssertNotNil(attributedString.range(of: basket.getBasketPriceWithoutDiscountString()!))
        XCTAssertNotNil(attributedString.range(of: basket.getBasketPriceWithDiscountString()!))
    }
    
    func buttonAction(item: ButtonItem) { }
}
