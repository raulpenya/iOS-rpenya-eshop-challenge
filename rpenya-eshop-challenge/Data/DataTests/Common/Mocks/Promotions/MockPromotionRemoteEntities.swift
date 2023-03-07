//
//  MockPromotionRemoteEntities.swift
//  Data
//
//  Created by raulbot on 6/3/23.
//

import Foundation
@testable import Data

struct MockPromotionsRemoteEntity {
    static func givenPromotions(unknownType: Bool = false) -> PromotionsRemoteEntity {
        if unknownType {
            return PromotionsRemoteEntity(promotions: [MockPromotionRemoteEntity.givenPromotion1(type: "unknown"), MockPromotionRemoteEntity.givenPromotion2()])
        } else {
            return PromotionsRemoteEntity(promotions: [MockPromotionRemoteEntity.givenPromotion1(), MockPromotionRemoteEntity.givenPromotion2()])
        }
    }
}

struct MockPromotionRemoteEntity {
    static let productCode1 = "TSHIRT"
    static let name1 = "Pay 1 get 2"
    static let type1 = "PERCENTAGE"
    static let unitsNeeded1 = 2
    static let discount1 = 0.50
    
    static let productCode2 = "VOUCHER"
    static let name2 = "Pay 1 get 2"
    static let type2 = "NEWPRICE"
    static let unitsNeeded2 = 2
    static let discount2 = 0.50
    
    static func givenPromotion1(type: String = MockPromotionRemoteEntity.type1) -> PromotionRemoteEntity {
        return PromotionRemoteEntity(productCode: productCode1, name: name1, type: type, unitsNeeded: unitsNeeded1, discount: discount1)
    }
    
    static func givenPromotion2() -> PromotionRemoteEntity {
        return PromotionRemoteEntity(productCode: productCode2, name: name2, type: type2, unitsNeeded: unitsNeeded2, discount: discount2)
    }
}
