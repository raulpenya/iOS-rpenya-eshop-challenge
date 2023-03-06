//
//  PromotionsRepository.swift
//  Domain
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Combine

public protocol PromotionsRepository {
    func getAllPromotions() -> AnyPublisher<[Promotion], Error>
}
