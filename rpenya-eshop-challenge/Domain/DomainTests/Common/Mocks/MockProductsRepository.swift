//
//  MockProductsRepository.swift
//  DomainTests
//
//  Created by raulbot on 7/3/23.
//

import Foundation
@testable import Domain
import Combine

enum RepositoryResponse {
    case success
    case error
}

class MockProductsRepository: ProductsRepository {
    var called = false
    var response: RepositoryResponse = .success
    func getAllProducts() -> AnyPublisher<Domain.Products, Error> {
        called = true
        switch response {
        case .success:
            return Result.Publisher(MockProducts.givenProducts(duplicates: false)).eraseToAnyPublisher()
        case .error:
            return Fail(error: NSError(domain: "MockProductsRepository :: error", code: 0)).eraseToAnyPublisher()
        }
    }
}
