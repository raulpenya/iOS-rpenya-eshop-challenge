//
//  NetworkingDataSourceRequestTests.swift
//  DataTests
//
//  Created by raulbot on 5/3/23.
//

import XCTest
import Combine
@testable import Data
import Domain

final class NetworkingDataSourceRequestTests: XCTestCase {
    
    enum RequestResponse {
        case success
        case error
    }
    
    let dataSource = MockNetworkingDataSource()
    let session = MockSession()
    var transformCalled = false
    var response: RequestResponse?
    var errorResponse: Error?
    var urlRequest: URLRequest?
    var resource: Resource<ProductsRemoteEntity, [Product]>?
    
    override func setUpWithError() throws {
        urlRequest = try! ProductsApi.getAllProducts.asURLRequest()
        resource = Resource<ProductsRemoteEntity, [Product]>(request: urlRequest!) { [weak self] products in
            self?.transformCalled = true
            return products.transformToDomain()
        }
        transformCalled = false
        response = nil
    }

    func test_request_success() {
        //Given
        session.response = .success
        let expectation = expectation(description: "test_request_success")
        //When
        dataSource.request(with: session, resource: resource).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertTrue(transformCalled)
        XCTAssertNil(errorResponse)
    }
    
    func test_request_noresource_error() {
        //Given
        session.response = .success
        let expectation = expectation(description: "test_request_error")
        resource = nil
        //When
        dataSource.request(with: session, resource: resource).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertFalse(transformCalled)
        XCTAssertNotNil(errorResponse)
        XCTAssertNotEqual((errorResponse! as NSError).domain.description, String.getErrorResponse())
        XCTAssertEqual((errorResponse! as! DataSourceErrors).localizedDescription, DataSourceErrors.requestException.localizedDescription)
        XCTAssertEqual((errorResponse! as! DataSourceErrors).code, DataSourceErrors.requestException.code)
    }
    
    func test_request_error() {
        //Given
        session.response = .error
        let expectation = expectation(description: "test_request_error")
        //When
        dataSource.request(with: session, resource: resource).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertFalse(transformCalled)
        XCTAssertNotNil(errorResponse)
    }
    
    func test_request_handleResponse_error() {
        //Given
        session.response = .errorHandleResponse
        let expectation = expectation(description: "test_request_handleResponse_error")
        //When
        dataSource.request(with: session, resource: resource).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertFalse(transformCalled)
        XCTAssertNotNil(errorResponse)
        XCTAssertNotEqual((errorResponse! as NSError).domain.description, String.getErrorResponse())
        XCTAssertEqual((errorResponse! as! DataSourceErrors).localizedDescription, DataSourceErrors.castHTTPURLResponseException.localizedDescription)
        XCTAssertEqual((errorResponse! as! DataSourceErrors).code, DataSourceErrors.castHTTPURLResponseException.code)
    }
    
    func test_request_decode_error() {
        //Given
        session.response = .errorDecode
        let expectation = expectation(description: "test_request_decode_error")
        //When
        dataSource.request(with: session, resource: resource).sink { [weak self] completion in
            print(completion)
            switch completion {
            case .failure(let error):
                self?.response = .error
                self?.errorResponse = error
            case .finished:
                self?.response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .error)
        XCTAssertFalse(transformCalled)
        XCTAssertNotNil(errorResponse)
    }
}
