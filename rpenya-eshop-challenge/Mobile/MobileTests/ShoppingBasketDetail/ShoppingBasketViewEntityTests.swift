//
//  ShoppingBasketViewEntityTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 11/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ShoppingBasketViewEntityTests: XCTestCase {
    func test_transformToShoppingBasketList() {
        //Given
        let shoppingBasket = MockShoppingBasketViewEntity.givenShoppingBasket()
        //When
        let shoppingBasketList = shoppingBasket.transformToShoppingBasketList()
        //Then
        XCTAssertEqual(shoppingBasket.products.count, shoppingBasketList.items.count)
        XCTAssertEqual(shoppingBasket.products[0].product, (shoppingBasketList.items[0].item as! ShoppingBasketListItem).basketProduct.product)
        XCTAssertEqual(shoppingBasket.products[0].units, (shoppingBasketList.items[0].item as! ShoppingBasketListItem).basketProduct.units)
    }
    
    func test_transformToProductListButtonItem() {
        //Given
        let shoppingBasket = MockShoppingBasketViewEntity.givenShoppingBasket()
        //When
        let buttonItem = shoppingBasket.transformToProductListButtonItem(action: buttonAction)
        //Then
        XCTAssertFalse(buttonItem.isDisabled)
    }
    
    func buttonAction(item: ButtonItem) { }
}
