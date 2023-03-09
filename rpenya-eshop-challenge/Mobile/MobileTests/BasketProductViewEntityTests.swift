//
//  BasketProductViewEntityTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class BasketProductViewEntityTests: XCTestCase {
    func test_transformToProductList() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1()
        //When
        let item = basketProduct.transformToProductsListItem(view: .productsList, action: action)
        //Then
        XCTAssertEqual(item.basketProduct.product, basketProduct.product)
        XCTAssertEqual(item.view, .productsList)
    }

    func test_transformToBasketProduct() {
        //Given
        let product = MockProduct.givenProduct1()
        //When
        let basketProduct = product.transformToBasketProduct()
        //Then
        XCTAssertEqual(basketProduct.product, product.transformToUI())
        XCTAssertEqual(basketProduct.units, 0)
    }
    
    func test_equatable_true() {
        //Given
        let basketProduct1 = MockBasketProductViewEntity.givenBasketProduct1()
        let basketProduct2 = MockBasketProductViewEntity.givenBasketProduct1()
        //When
        let result = basketProduct1 == basketProduct2
        //Then
        XCTAssertTrue(result)
    }
    
    func test_equatable_false() {
        //Given
        let basketProduct1 = MockBasketProductViewEntity.givenBasketProduct1()
        let basketProduct2 = MockBasketProductViewEntity.givenBasketProduct2()
        //When
        let result = basketProduct1 == basketProduct2
        //Then
        XCTAssertFalse(result)
    }
    
    func test_modifyUnits_increase() {
        
    }
    
    func test_modifyUnits_decrease() {
        
    }
    
    func test_getDiscountAmount() {
        
    }
    
    func test_getAmountWithoutDiscount() {
        
    }
    
    func test_getAmountWithDiscount() {
        
    }
    
    func test_getAmountWithPercentageDiscount() {
        
    }
    
    func test_getAmountWithNewPriceDiscount() {
        
    }
    
    func action(item: ProductsListItem, action: ProductsListItemAction) { }
}
