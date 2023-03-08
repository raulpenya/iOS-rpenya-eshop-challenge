//
//  MockPromotionViewEntity.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge
import Domain

struct MockPromotionViewEntity {
    static let productCode1 = "TSHIRT"
    static let name1 = "Pay 1 get 2"
    static let type1 = PromotionType.percentage
    static let unitsNeeded1 = 2
    static let discount1 = 0.50
    
    static func givenPromotion1() -> PromotionViewEntity {
        return PromotionViewEntity(productCode: productCode1, name: name1, type: type1, unitsNeeded: unitsNeeded1, discount: discount1)
    }
}
