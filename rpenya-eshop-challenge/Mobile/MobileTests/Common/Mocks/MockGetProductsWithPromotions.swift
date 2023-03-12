//
//  MockGetProductsWithPromotions.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 10/3/23.
//

import Foundation
@testable import Domain
@testable import rpenya_eshop_challenge
import Combine

class MockGetProductsWithPromotions: GetProductsWithPromotions {
    var called: Bool = false
    var response: RepositoryResponse = .success
    
    static func getUseCase() -> MockGetProductsWithPromotions {
        return MockGetProductsWithPromotions(productsRepository: MockProductsRepository(), promotionsRepository: MockPromotionsRepository())
    }
    
    override func execute(_ requestValues: GetProductsWithPromotionsRequestValues) -> AnyPublisher<Products, Error> {
        called = true
        switch response {
        case .success:
            return Result.Publisher(MockProducts.givenProducts(duplicates: false)).eraseToAnyPublisher()
        case .error:
            return Fail(error: NSError(domain: "MockGetProductsWithPromotions :: error", code: 0)).eraseToAnyPublisher()
        }
    }
}
