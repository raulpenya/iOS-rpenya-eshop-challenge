//
//  PromotionViewEntityTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class PromotionViewEntityTests: XCTestCase {
    func test_transformToUI() {
        //Given
        let promotion = MockPromotion.givenPromotion1()
        //When
        let promotionViewEntity = promotion.transformToUI()
        //Then
        XCTAssertEqual(promotion.productCode, promotionViewEntity.productCode)
        XCTAssertEqual(promotion.name, promotionViewEntity.name)
        XCTAssertEqual(promotion.type, promotionViewEntity.type)
        XCTAssertEqual(promotion.unitsNeeded, promotionViewEntity.unitsNeeded)
        XCTAssertEqual(promotion.discount, promotionViewEntity.discount)
    }
}
