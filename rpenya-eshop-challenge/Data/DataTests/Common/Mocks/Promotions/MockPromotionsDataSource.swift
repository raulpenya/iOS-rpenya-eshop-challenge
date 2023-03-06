//
//  MockPromotionsDataSource.swift
//  Data
//
//  Created by raulbot on 6/3/23.
//

import Foundation
@testable import Data
import Combine
import Domain

class MockPromotionsDataSource: PromotionsDataSource {
    var called: Bool = false
    var response: DataSourceResponse = .success
    
    func getAllPromotions() -> AnyPublisher<[Domain.Promotion], Error> {
        called = true
        switch response {
        case .success:
            return Result.Publisher([MockPromotion.givenPromotion()]).eraseToAnyPublisher()
        case .error:
            return Fail(error: DataSourceErrors.networkingRequestError).eraseToAnyPublisher()
        }
    }
}
