//
//  ProductsRemoteDataSourceTests.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 6/3/23.
//

import XCTest
@testable import Data
import Combine

final class ProductsRemoteDataSourceTests: XCTestCase {

    let dataSource = ProductsRemoteDataSource()
    var response: DataSourceResponse?
    var errorResponse: Error?
    var cancellableSet: Set<AnyCancellable> = []
    
    func test_getAllProducts_success() {
        //Given
        let expectation = expectation(description: "test_session_executeTaskPublisher")
        //When
        dataSource.getAllProducts().sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.store(in: &cancellableSet)
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertNil(errorResponse)
    }

}
