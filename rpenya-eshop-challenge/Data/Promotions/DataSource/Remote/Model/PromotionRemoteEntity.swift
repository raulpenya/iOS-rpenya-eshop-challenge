//
//  PromotionRemoteEntity.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain

struct PromotionRemoteEntity: Decodable, Equatable {
    let productCode: String?
    let name: String?
    let type: String?
    let unitsNeeded: Int?
    let discount: Double?
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.productCode == rhs.productCode
    }
}

extension PromotionRemoteEntity {
    func transformToDomain() -> Promotion? {
        guard let productCode = productCode,
              let name = name,
              let type = type, let type = PromotionType(rawValue: type),
              let unitsNeeded = unitsNeeded,
                let discount = discount else { return nil }
        return Promotion(productCode: productCode, name: name, type: type, unitsNeeded: unitsNeeded, discount: discount)
    }
}
