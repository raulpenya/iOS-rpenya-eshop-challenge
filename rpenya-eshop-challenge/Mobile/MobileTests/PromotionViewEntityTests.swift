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
    
    func test_equatable_true() {
        //Given
        let promotion1 = MockPromotionViewEntity.givenPromotion1()
        let promotion2 = MockPromotionViewEntity.givenPromotion1()
        //When
        let result = promotion1 == promotion2
        //Then
        XCTAssertTrue(result)
    }
    
    func test_equatable_false() {
        //Given
        let promotion1 = MockPromotionViewEntity.givenPromotion1()
        let promotion2 = MockPromotionViewEntity.givenPromotion2()
        //When
        let result = promotion1 == promotion2
        //Then
        XCTAssertFalse(result)
    }
}
