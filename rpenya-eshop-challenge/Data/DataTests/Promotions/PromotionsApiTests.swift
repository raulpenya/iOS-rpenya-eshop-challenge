//
//  PromotionsApiTests.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 6/3/23.
//

import XCTest
@testable import Data

final class PromotionsApiTests: XCTestCase {
    func test_getAllPromotions_success() {
        //Given
        var urlRequest: URLRequest?
        var apiError: Error?
        //When
        do {
            urlRequest = try PromotionsApi.getAllPromotions.asURLRequest()
        } catch {
            apiError = error
        }
        //Then
        XCTAssertNil(apiError)
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.absoluteString, DataConstants.baseUrl + DataConstants.getPromotionsEndpoint)
        XCTAssertEqual(urlRequest?.httpBody, nil)
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields?.count, 2)
        XCTAssertEqual(urlRequest?.cachePolicy, .useProtocolCachePolicy)
        XCTAssertEqual(urlRequest?.httpMethod, HTTPMethod.get.rawValue)
    }
}
