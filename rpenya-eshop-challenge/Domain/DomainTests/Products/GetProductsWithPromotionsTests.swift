//
//  GetProductsWithPromotionsTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 7/3/23.
//

import XCTest
@testable import Domain

final class GetProductsWithPromotionsTests: XCTestCase {
    
    let productsRepository = MockProductsRepository()
    let promotionsRepository = MockPromotionsRepository()
    var response: RepositoryResponse?
    var products: Products?
    
    override func setUpWithError() throws {
        response = nil
        products = nil
    }

    func test_getProductsWithPromotions_success() {
        //Given
        productsRepository.response = .success
        promotionsRepository.response = .success
        let usecase = GetProductsWithPromotions(productsRepository: productsRepository, promotionsRepository: promotionsRepository)
        let expectation = expectation(description: "test_getProductsWithPromotions_success")
        //When
        usecase.execute(GetProductsWithPromotionsRequestValues()).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure:
                self?.response = .error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] products in
            self?.products = products
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertNotNil(products)
    }

    func test_getProductsWithPromotions_bothRepositoriesErrors() {
        //Given
        productsRepository.response = .error
        promotionsRepository.response = .error
        let usecase = GetProductsWithPromotions(productsRepository: productsRepository, promotionsRepository: promotionsRepository)
        let expectation = expectation(description: "test_getProductsWithPromotions_success")
        //When
        usecase.execute(GetProductsWithPromotionsRequestValues()).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure:
                self?.response = .error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] products in
            self?.products = products
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertNil(products)
    }
    
    func test_getProductsWithPromotions_productsRepositoryErrors() {
        //Given
        productsRepository.response = .error
        promotionsRepository.response = .success
        let usecase = GetProductsWithPromotions(productsRepository: productsRepository, promotionsRepository: promotionsRepository)
        let expectation = expectation(description: "test_getProductsWithPromotions_success")
        //When
        usecase.execute(GetProductsWithPromotionsRequestValues()).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure:
                self?.response = .error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] products in
            self?.products = products
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertNil(products)
    }
    
    func test_getProductsWithPromotions_promotionsRepositoryErrors() {
        //Given
        productsRepository.response = .success
        promotionsRepository.response = .error
        let usecase = GetProductsWithPromotions(productsRepository: productsRepository, promotionsRepository: promotionsRepository)
        let expectation = expectation(description: "test_getProductsWithPromotions_success")
        //When
        usecase.execute(GetProductsWithPromotionsRequestValues()).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure:
                self?.response = .error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { [weak self] products in
            self?.products = products
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertNotNil(products)
    }
}
