//
//  PromotionsRemoteDataSource.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

public class PromotionsRemoteDataSource: PromotionsDataSource, NetworkingDataSource {
    
    public init() {}
    
    public func getAllPromotions() -> AnyPublisher<Domain.Promotions, Error> {
        return request(resource: PromotionResources.getAllPromotionsResource())
    }
}
