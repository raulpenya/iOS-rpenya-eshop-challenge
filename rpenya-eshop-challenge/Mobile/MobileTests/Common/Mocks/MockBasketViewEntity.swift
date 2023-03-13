//
//  MockBasketViewEntity.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

struct MockBasketViewEntity {
    static let currency = "€"
    static func givenBasket() -> BasketViewEntity {
        return BasketViewEntity(products: [MockBasketProductViewEntity.givenBasketProduct1(), MockBasketProductViewEntity.givenBasketProduct2()], currency: currency)
    }
}
