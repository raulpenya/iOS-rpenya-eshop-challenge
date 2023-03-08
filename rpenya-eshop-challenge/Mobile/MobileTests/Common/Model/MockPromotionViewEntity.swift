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
    
    static let productCode2 = "VOUCHER"
    static let name2 = "Pay 1 get 2"
    static let type2 = PromotionType.newprice
    static let unitsNeeded2 = 2
    static let discount2 = 0.50
    
    static func givenPromotion1() -> PromotionViewEntity {
        return PromotionViewEntity(productCode: productCode1, name: name1, type: type1, unitsNeeded: unitsNeeded1, discount: discount1)
    }
    
    static func givenPromotion2() -> PromotionViewEntity {
        return PromotionViewEntity(productCode: productCode2, name: name2, type: type2, unitsNeeded: unitsNeeded2, discount: discount2)
    }
}
