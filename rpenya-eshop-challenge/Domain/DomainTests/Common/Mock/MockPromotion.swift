//
//  MockPromotion.swift
//  Domain
//
//  Created by raulbot on 6/3/23.
//

import Foundation
@testable import Domain

struct MockPromotions {
    static func givenPromotions() -> Promotions {
        return Promotions(promotions: [MockPromotion.givenPromotion()])
    }
}

struct MockPromotion {
    static func givenPromotion() -> Promotion {
        return Promotion(productCode: "", name: "", type: .percentage, unitsNeeded: 2, discount: 0.50)
    }
}
