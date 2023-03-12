//
//  MockShoppingBasketViewEntity.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

struct MockShoppingBasketViewEntity {    static let currency = "€"
    static let price = 15.00
    static let priceWithoutDiscount = 30.00
    
    static func givenShoppingBasket() -> ShoppingBasketViewEntity {
        ShoppingBasketViewEntity(products: [MockBasketProductViewEntity.givenBasketProduct1(),MockBasketProductViewEntity.givenBasketProduct2()], currency: currency, price: price, priceWithoutDiscount: priceWithoutDiscount)
    }
}
