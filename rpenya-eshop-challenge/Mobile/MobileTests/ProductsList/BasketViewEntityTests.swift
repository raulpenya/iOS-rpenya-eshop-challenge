//
//  BasketViewEntityTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class BasketViewEntityTests: XCTestCase {
    func test_transformToProductsList() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        //When
        let productsList = basket.transformToProductsList(action: action)
        //Then
        XCTAssertEqual(basket.products[0].product, (productsList.items[0].item as! ProductsListItem).basketProduct.product)
        XCTAssertEqual(basket.products[0].units, (productsList.items[0].item as! ProductsListItem).basketProduct.units)
    }
    
    func test_transformToProductListButtonItem() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        //When
        let buttonItem = basket.transformToProductListButtonItem(action: buttonAction)
        //Then
        XCTAssertFalse(buttonItem.isDisabled)
    }
    
    func test_transformToProductListButtonItem_empty() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 0)
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        //When
        let buttonItem = basket.transformToProductListButtonItem(action: buttonAction)
        //Then
        XCTAssertTrue(buttonItem.isDisabled)
    }
    
    func test_transformToBasket() {
        //Given
        let products = MockProducts.givenProducts(duplicates: false)
        //When
        let basket = products.transformToBasket()
        //Then
        XCTAssertEqual(basket.products.count, products.products.count)
    }
    
    func test_transformToShoppingBasket_success() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        //When
        let shoppingBasket = basket.transformToShoppingBasket()
        //Then
        XCTAssertNotNil(shoppingBasket)
        XCTAssertEqual(shoppingBasket?.products.count, basket.products.count)
        XCTAssertEqual(shoppingBasket?.currency, basket.currency)
    }
    
    func test_transformToShoppingBasket_unsuccess() {
        //Given
        let basket = BasketViewEntity(products: [MockBasketProductViewEntity.givenBasketProduct1(units: 0)], currency: "€")
        //When
        let shoppingBasket = basket.transformToShoppingBasket()
        //Then
        XCTAssertNil(shoppingBasket)
    }
    
    func test_isEmpty_true() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 0)
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        //When
        let result = basket.isEmpty()
        //Then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_false() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1()
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        //When
        let result = basket.isEmpty()
        //Then
        XCTAssertFalse(result)
    }
    
    func test_modifyProductUnits_increase_success() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 0)
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        //When
        let newBasket = basket.modifyProductUnits(basketProduct, action: .addProduct)
        //Then
        XCTAssertEqual(newBasket.products[0].units, 1)
    }
    
    func test_modifyProductUnits_increase_unsuccess() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: BasketProductViewEntity.max_units)
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        //When
        let newBasket = basket.modifyProductUnits(basketProduct, action: .addProduct)
        //Then
        XCTAssertEqual(newBasket.products[0].units, BasketProductViewEntity.max_units)
    }
    
    func test_modifyProductUnits_decrease_success() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 1)
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        //When
        let newBasket = basket.modifyProductUnits(basketProduct, action: .removeProduct)
        //Then
        XCTAssertEqual(newBasket.products[0].units, 0)
    }
    
    func test_modifyProductUnits_decrease_unsuccess() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: BasketProductViewEntity.min_units)
        let basket = BasketViewEntity(products: [basketProduct], currency: "€")
        //When
        let newBasket = basket.modifyProductUnits(basketProduct, action: .removeProduct)
        //Then
        XCTAssertEqual(newBasket.products[0].units, 0)
    }
    
    func test_getBasketPriceString() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        //When
        let priceString = basket.getBasketPriceWithDiscountString()
        //Then
        XCTAssertEqual(priceString, "56.00€")
    }
    
    func test_getBasketPriceString_empty() {
        //Given
        let basketProduct = MockBasketProductViewEntity.givenBasketProduct1(units: 0)
        let basket = BasketViewEntity(products: [basketProduct], currency: MockBasketViewEntity.currency)
        //When
        let priceString = basket.getBasketPriceWithDiscountString()
        //Then
        XCTAssertNil(priceString)
    }
    
    func action(item: ProductsListItem, action: ProductsListItemAction) { }
    func buttonAction(item: ButtonItem) { }
}
