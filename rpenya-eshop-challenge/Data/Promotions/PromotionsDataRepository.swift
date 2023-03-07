//
//  PromotionsDataRepository.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

struct PromotionsDataRepository: PromotionsRepository {
    let dataSource: PromotionsDataSource
    
    func getAllPromotions() -> AnyPublisher<Domain.Promotions, Error> {
        return dataSource.getAllPromotions()
    }
}
