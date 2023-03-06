//
//  PromotionsDataRepositoryTests.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 6/3/23.
//

import XCTest
@testable import Data
import Domain

final class PromotionsDataRepositoryTests: XCTestCase {
    
    let dataSource = MockPromotionsDataSource()
    var response: DataSourceResponse?
    var errorResponse: Error?
    var promotionsResponse: [Promotion] = []

    override func setUpWithError() throws {
        response = nil
        errorResponse = nil
        promotionsResponse = []
        dataSource.called = false
    }

    func test_getAllPromotions_success() {
        //Given
        dataSource.response = .success
        let dataRepository = PromotionsDataRepository(dataSource: dataSource)
        let expectation = expectation(description: "test_getAllPromotions_success")
        //When
        dataRepository.getAllPromotions().sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] promotions in
            self?.promotionsResponse = promotions
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertNil(errorResponse)
        XCTAssertTrue(dataSource.called)
        XCTAssertFalse(promotionsResponse.isEmpty)
        XCTAssertEqual(promotionsResponse.count, 1)
    }
    
    func test_getAllPromotions_error() {
        //Given
        dataSource.response = .error
        let dataRepository = PromotionsDataRepository(dataSource: dataSource)
        let expectation = expectation(description: "test_getAllPromotions_error")
        //When
        dataRepository.getAllPromotions().sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] promotions in
            self?.promotionsResponse = promotions
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertNotNil(errorResponse)
        XCTAssertTrue(dataSource.called)
        XCTAssertTrue(promotionsResponse.isEmpty)
    }
}
