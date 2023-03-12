//
//  MockPromotion.swift
//  Domain
//
//  Created by raulbot on 6/3/23.
//

import Foundation
@testable import Domain

struct MockPromotions {
    static func givenPromotions(duplicates: Bool = true) -> Promotions {
        if duplicates {
            return Promotions(promotions: [MockPromotion.givenPromotion1(), MockPromotion.givenPromotion1(), MockPromotion.givenPromotion2(), MockPromotion.givenPromotion2()])
        } else {
            return Promotions(promotions: [MockPromotion.givenPromotion1(), MockPromotion.givenPromotion2()])
        }
    }
}

struct MockPromotion {
    static let productCode1 = "TSHIRT"
    static let name1 = "Pay 1 get 2"
    static let type1 = PromotionType.percentage
    static let unitsNeeded1 = 2
    static let discount1 = 0.50
    
    static let productCode2 = "VOUCHER"
    static let name2 = "Pay 1 get 2"
    static let type2 = PromotionType.percentage
    static let unitsNeeded2 = 2
    static let discount2 = 0.50
    
    static func givenPromotion1() -> Promotion {
        return Promotion(productCode: productCode1, name: name1, type: type1, unitsNeeded: unitsNeeded1, discount: discount1)
    }
    static func givenPromotion2() -> Promotion {
        return Promotion(productCode: productCode2, name: name2, type: type2, unitsNeeded: unitsNeeded2, discount: discount2)
    }
}
