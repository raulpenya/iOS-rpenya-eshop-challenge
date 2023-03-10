//
//  MockBasketProductViewEntity.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

struct MockBasketProductViewEntity {
    static func givenBasketProduct1(units: Int = 3) -> BasketProductViewEntity {
        return BasketProductViewEntity(product: MockProductViewEntity.givenProduct1(), units: units)
    }
    
    static func givenBasketProduct2(units: Int = 4) -> BasketProductViewEntity {
        return BasketProductViewEntity(product: MockProductViewEntity.givenProduct2(), units: units)
    }
}
