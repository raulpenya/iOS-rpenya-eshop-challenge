//
//  PromotionViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation
import Domain

struct PromotionViewEntity {
    public let productCode: String
    public let name: String
    public let type: PromotionType
    public let unitsNeeded: Int
    public let discount: Double
    
    public init(productCode: String, name: String, type: PromotionType, unitsNeeded: Int, discount: Double) {
        self.productCode = productCode
        self.name = name
        self.type = type
        self.unitsNeeded = unitsNeeded
        self.discount = discount
    }
}

extension Promotion {
    func transformToUI() -> PromotionViewEntity {
        return PromotionViewEntity(productCode: productCode, name: name, type: type, unitsNeeded: unitsNeeded, discount: discount)
    }
}
