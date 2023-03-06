//
//  MockProductsDataSource.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import Foundation
@testable import Data
import Combine
import Domain

enum DataSourceResponse {
    case success
    case error
}

class MockProductsDataSource: ProductsDataSource {
    var called: Bool = false
    var response: DataSourceResponse = .success
    
    func getAllProducts() -> AnyPublisher<[Domain.Product], Error> {
        called = true
        switch response {
        case .success:
            return Result.Publisher([MockProduct.givenProduct()]).eraseToAnyPublisher()
        case .error:
            return Fail(error: DataSourceErrors.networkingRequestError).eraseToAnyPublisher()
        }
    }
}
