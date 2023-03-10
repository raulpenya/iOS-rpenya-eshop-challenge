//
//  PromotionsDataSource.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

public protocol PromotionsDataSource {
    func getAllPromotions() -> AnyPublisher<Domain.Promotions, Error>
}
