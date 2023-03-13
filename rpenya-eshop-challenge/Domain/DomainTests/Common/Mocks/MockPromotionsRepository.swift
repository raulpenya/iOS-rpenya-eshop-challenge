//
//  MockPromotionsRepository.swift
//  Domain
//
//  Created by raulbot on 7/3/23.
//

import Foundation
@testable import Domain
import Combine

class MockPromotionsRepository: PromotionsRepository {
    var called = false
    var response: RepositoryResponse = .success
    func getAllPromotions() -> AnyPublisher<Promotions, Error> {
        called = true
        switch response {
        case .success:
            return Result.Publisher(MockPromotions.givenPromotions(duplicates: false)).eraseToAnyPublisher()
        case .error:
            return Fail(error: NSError(domain: "MockPromotionsRepository :: error", code: 0)).eraseToAnyPublisher()
        }
    }
}
