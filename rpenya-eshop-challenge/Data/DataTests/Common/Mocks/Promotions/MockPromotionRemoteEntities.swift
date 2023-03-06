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
            return PromotionsRemoteEntity(promotions: [MockPromotionRemoteEntity.givenPromotion(type: "unknown"),MockPromotionRemoteEntity.givenPromotion(),MockPromotionRemoteEntity.givenPromotion()])
        } else {
            return PromotionsRemoteEntity(promotions: [MockPromotionRemoteEntity.givenPromotion(),MockPromotionRemoteEntity.givenPromotion(),MockPromotionRemoteEntity.givenPromotion()])
        }
    }
    
    static func givenPromotionsNil() -> PromotionsRemoteEntity {
        return PromotionsRemoteEntity(promotions: nil)
    }
}

struct MockPromotionRemoteEntity {
    static let productCode1 = "TSHIRT"
    static let name1 = "Pay 1 get 2"
    static let type1 = "PERCENTAGE"
    static let unitsNeeded1 = 2
    static let discount1 = 0.50
    
    static let productCode2 = "VOUCHER"
    
    static func givenPromotion(productCode: String = MockPromotionRemoteEntity.productCode1, name: String = MockPromotionRemoteEntity.name1, type: String = MockPromotionRemoteEntity.type1, unitsNeeded: Int = MockPromotionRemoteEntity.unitsNeeded1, discount: Double = MockPromotionRemoteEntity.discount1) -> PromotionRemoteEntity {
        return PromotionRemoteEntity(productCode: productCode, name: name, type: type, unitsNeeded: unitsNeeded, discount: discount)
    }
    
    static func givenPromotionNil() -> PromotionRemoteEntity {
        return PromotionRemoteEntity(productCode: nil, name: nil, type: nil, unitsNeeded: nil, discount: nil)
    }
}
