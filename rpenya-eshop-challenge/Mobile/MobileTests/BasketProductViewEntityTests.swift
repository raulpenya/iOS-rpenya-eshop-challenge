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
    
    func test_modifyUnits_increase_success() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1()
        //When
        let result = basketProduct.modifyUnits(.addProduct)
        //Then
        XCTAssertTrue(result.units > basketProduct.units)
        XCTAssertEqual(result.units, basketProduct.units+1)
    }
    
    func test_modifyUnits_increase_unsuccess() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: BasketProductViewEntity.max_units)
        //When
        let result = basketProduct.modifyUnits(.addProduct)
        //Then
        XCTAssertEqual(result.units, basketProduct.units)
        XCTAssertEqual(result.units, BasketProductViewEntity.max_units)
    }
    
    func test_modifyUnits_decrease_success() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1()
        //When
        let result = basketProduct.modifyUnits(.removeProduct)
        //Then
        XCTAssertTrue(result.units < basketProduct.units)
        XCTAssertEqual(result.units, basketProduct.units-1)
    }
    
    func test_modifyUnits_decrease_unsuccess() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: BasketProductViewEntity.min_units)
        //When
        let result = basketProduct.modifyUnits(.removeProduct)
        //Then
        XCTAssertEqual(result.units, basketProduct.units)
        XCTAssertEqual(result.units, BasketProductViewEntity.min_units)
    }
    
    func test_getDiscountAmount() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 3)
        //When
        let result = basketProduct.getDiscountAmount()
        //Then
        XCTAssertEqual(result, -20.00)
    }
    
    func test_getAmountWithoutDiscount() {
        //Given
        let product = MockProductViewEntity.givenProduct1(promotion: nil)
        let basketProduct = BasketProductViewEntity(product: product, units: 3)
        //When
        let result = basketProduct.getAmountWithDiscount()
        //Then
        XCTAssertEqual(result, Double(basketProduct.units)*basketProduct.product.price)
    }
    
    func test_getAmountWithDiscount_percentage() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 3)
        //When
        let result = basketProduct.getAmountWithDiscount()
        //Then
        XCTAssertEqual(result, 40.00)
    }
    
    func test_getAmountWithDiscount_newPrice() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct2(units: 3)
        //When
        let result = basketProduct.getAmountWithDiscount()
        //Then
        XCTAssertEqual(result, Double(basketProduct.units)*basketProduct.product.promotion!.discount)
    }
    
    func test_getAmountWithDiscount_noPromotion() {
        //Given
        let product = MockProductViewEntity.givenProduct1(promotion: nil)
        let basketProduct = BasketProductViewEntity(product: product, units: 3)
        //When
        let result = basketProduct.getAmountWithDiscount()
        //Then
        XCTAssertEqual(result, Double(basketProduct.units)*basketProduct.product.price)
    }
    
    func test_getAmountWithPercentageDiscount() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 3)
        //When
        let result = basketProduct.getAmountWithPercentageDiscount()
        //Then
        XCTAssertEqual(result, 40.00)
    }
    
    func test_getAmountWithNewPriceDiscount_discount() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct2(units: 3)
        //When
        let result = basketProduct.getAmountWithNewPriceDiscount()
        //Then
        XCTAssertEqual(result, Double(basketProduct.units)*basketProduct.product.promotion!.discount)
    }
    
    func test_getAmountWithNewPriceDiscount_noDiscount() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct2(units: 2)
        //When
        let result = basketProduct.getAmountWithNewPriceDiscount()
        //Then
        XCTAssertEqual(result, Double(basketProduct.units)*basketProduct.product.price)
    }
    
    func action(item: ProductsListItem, action: ProductsListItemAction) { }
}
