//
//  ProductsApiTests.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import XCTest
@testable import Data

final class ProductsApiTests: XCTestCase {
    func test_getAllProducts_request() {
        //Given
        var urlRequest: URLRequest?
        var apiError: Error?
        //When
        do {
            urlRequest = try ProductsApi.getAllProducts.asURLRequest()
        } catch {
            apiError = error
        }
        //Then
        XCTAssertNil(apiError)
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.absoluteString, DataConstants.baseUrl + DataConstants.getProductsEndpoint)
        XCTAssertEqual(urlRequest?.httpBody, nil)
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields?.count, 2)
        XCTAssertEqual(urlRequest?.cachePolicy, .useProtocolCachePolicy)
        XCTAssertEqual(urlRequest?.httpMethod, HTTPMethod.get.rawValue)
    }
}
