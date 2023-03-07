//
//  ProductsDataRepositoryTests.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import XCTest
@testable import Data
import Domain

final class ProductsDataRepositoryTests: XCTestCase {

    let dataSource = MockProductsDataSource()
    var response: DataSourceResponse?
    var errorResponse: Error?
    var productsResponse: Products?
    
    override func setUpWithError() throws {
        response = nil
        errorResponse = nil
        productsResponse = nil
        dataSource.called = false
    }
    
    func test_getAllProducts_success() {
        //Given
        dataSource.response = .success
        let dataRepository = ProductsDataRepository(dataSource: dataSource)
        let expectation = expectation(description: "test_getAllProducts_success")
        //When
        dataRepository.getAllProducts().sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] products in
            self?.productsResponse = products
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertNil(errorResponse)
        XCTAssertTrue(dataSource.called)
        XCTAssertNotNil(productsResponse)
        XCTAssertFalse(productsResponse!.products.isEmpty)
    }
    
    func test_getAllProducts_error() {
        //Given
        dataSource.response = .error
        let dataRepository = ProductsDataRepository(dataSource: dataSource)
        let expectation = expectation(description: "test_getAllProducts_error")
        //When
        dataRepository.getAllProducts().sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] products in
            self?.productsResponse = products
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertNotNil(errorResponse)
        XCTAssertTrue(dataSource.called)
        XCTAssertNil(productsResponse)
    }
}
