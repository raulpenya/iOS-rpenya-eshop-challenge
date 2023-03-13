//
//  ErrorDescriptionTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ErrorDescriptionTests: XCTestCase {
    func test_transformToErrorDescription() {
        //Given
        let error = NSError(domain: "ErrorDescriptionTests :: domain", code: 100)
        //When
        let errorDescription = error.transformToErrorDescription()
        //Then
        XCTAssertEqual(errorDescription.text, error.localizedDescription)
    }
}
