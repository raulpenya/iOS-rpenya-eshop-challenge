//
//  SessionTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 6/3/23.
//

import XCTest
@testable import Data
import Domain
import Combine

final class SessionTests: XCTestCase {
    
    var response: DataSourceResponse?
    var errorResponse: Error?
    var cancellableSet: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        response = nil
        errorResponse = nil
    }
    
    func test_session_executeTaskPublisher() {
        //Given
        let dataSource = ProductsRemoteDataSource()
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
