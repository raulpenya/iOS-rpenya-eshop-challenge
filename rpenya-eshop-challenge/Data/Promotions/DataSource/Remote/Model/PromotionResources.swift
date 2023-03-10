//
//  PromotionResources.swift
//  Data
//
//  Created by raulbot on 6/3/23.
//

import Foundation
import Domain

struct PromotionResources {
    static func getAllPromotionsResource() -> Resource<PromotionsRemoteEntity, Promotions>? {
        guard let urlRequest = try? PromotionsApi.getAllPromotions.asURLRequest() else { return nil }
        return Resource<PromotionsRemoteEntity, Promotions>(request: urlRequest) { promotions in
            return promotions.transformToDomain()
        }
    }
}
