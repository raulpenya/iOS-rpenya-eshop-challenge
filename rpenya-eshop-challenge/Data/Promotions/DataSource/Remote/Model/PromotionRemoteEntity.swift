//
//  PromotionRemoteEntity.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain

struct PromotionRemoteEntity: Decodable, Equatable {
    let productCode: String
    let type: String
    let unitsNeeded: Int
    let discount: Double
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.productCode == rhs.productCode
    }
}

extension PromotionRemoteEntity {
    func transformToDomain() -> Promotion? {
        guard let type = PromotionType(rawValue: type) else { return nil }
        return Promotion(productCode: productCode, type: type, unitsNeeded: unitsNeeded, discount: discount)
    }
}
