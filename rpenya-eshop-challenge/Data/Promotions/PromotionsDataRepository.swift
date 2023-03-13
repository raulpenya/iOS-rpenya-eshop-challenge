//
//  PromotionsDataRepository.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

public struct PromotionsDataRepository: PromotionsRepository {
    
    let dataSource: PromotionsDataSource
    
    public init(dataSource: PromotionsDataSource) {
        self.dataSource = dataSource
    }
    
    public func getAllPromotions() -> AnyPublisher<Domain.Promotions, Error> {
        return dataSource.getAllPromotions()
    }
}
