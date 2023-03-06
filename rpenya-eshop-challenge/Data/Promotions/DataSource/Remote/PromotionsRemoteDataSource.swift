//
//  PromotionsRemoteDataSource.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

class PromotionsRemoteDataSource: PromotionsDataSource, NetworkingDataSource {
    func getAllPromotions() -> AnyPublisher<[Domain.Promotion], Error> {
        return request(resource: PromotionResources.getAllPromotionsResource())
    }
}
