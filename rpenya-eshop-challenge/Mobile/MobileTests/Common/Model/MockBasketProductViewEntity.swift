//
//  MockBasketProductViewEntity.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

struct MockBasketProductViewEntity {
    static func givenBasketProduct() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: MockProductViewEntity.givenProduct1(), units: 3)
    }
}
