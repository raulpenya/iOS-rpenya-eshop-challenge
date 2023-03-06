//
//  PromotionsRemoteDataSourceTests.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 6/3/23.
//

import XCTest
@testable import Data
import Combine

final class PromotionsRemoteDataSourceTests: XCTestCase {

    let dataSource = PromotionsRemoteDataSource()
    var response: DataSourceResponse?
    var errorResponse: Error?
    var cancellableSet: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_getAllPromotions_success() {
        //Given
        let expectation = expectation(description: "test_session_executeTaskPublisher")
        //When
        dataSource.getAllPromotions().sink { [weak self] completion in
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
