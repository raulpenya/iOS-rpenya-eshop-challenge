//
//  PromotionsRemoveDuplicatesTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 7/3/23.
//

import XCTest
@testable import Domain

final class PromotionsRemoveDuplicatesTests: XCTestCase {
    func test_removeDuplicates_withDuplicates() {
        //Given
        let promotionsWithDuplicates = MockPromotions.givenPromotions()
        //When
        let finalPromotions = promotionsWithDuplicates.removeDuplicates()
        //Then
        XCTAssertTrue(promotionsWithDuplicates.promotions.count > finalPromotions.promotions.count)
        XCTAssertEqual(promotionsWithDuplicates.promotions.count, 4)
        XCTAssertEqual(finalPromotions.promotions.count, 2)
        XCTAssertEqual(finalPromotions.promotions[0].productCode, MockPromotion.productCode1)
        XCTAssertEqual(finalPromotions.promotions[1].productCode, MockPromotion.productCode2)
    }

    func test_removeDuplicates_withoutDuplicates() {
        //Given
        let promotionsWithoutDuplicates = MockPromotions.givenPromotions(duplicates: false)
        //When
        let finalPromotions = promotionsWithoutDuplicates.removeDuplicates()
        //Then
        XCTAssertEqual(promotionsWithoutDuplicates.promotions.count, finalPromotions.promotions.count)
        XCTAssertEqual(promotionsWithoutDuplicates.promotions.count, 2)
        XCTAssertEqual(finalPromotions.promotions.count, 2)
        XCTAssertEqual(finalPromotions.promotions[0].productCode, MockPromotion.productCode1)
        XCTAssertEqual(finalPromotions.promotions[1].productCode, MockPromotion.productCode2)
    }
}
