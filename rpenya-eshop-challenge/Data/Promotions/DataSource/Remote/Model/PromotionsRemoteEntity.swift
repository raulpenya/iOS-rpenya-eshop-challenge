//
//  PromotionsRemoteEntity.swift
//  Data
//
//  Created by raulbot on 6/3/23.
//

import Foundation
import Domain

struct PromotionsRemoteEntity: Decodable {
    let promotions: [PromotionRemoteEntity]?
}

extension PromotionsRemoteEntity {
    func transformToDomain() -> [Promotion] {
        return promotions?.compactMap { $0.transformToDomain() } ?? []
    }
}
