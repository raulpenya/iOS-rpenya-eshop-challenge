//
//  MockShoppingBasketListItem.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

struct MockShoppingBasketListItem {
    static func givenShoppingBasketListItem1() -> ShoppingBasketListItem {
        return ShoppingBasketListItem(basketProduct: MockBasketProductViewEntity.givenBasketProduct1())
    }
    
    static func givenShoppingBasketListItem2() -> ShoppingBasketListItem {
        return ShoppingBasketListItem(basketProduct: MockBasketProductViewEntity.givenBasketProduct2())
    }
}
