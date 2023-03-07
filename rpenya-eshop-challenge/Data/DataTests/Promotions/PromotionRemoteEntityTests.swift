//
//  PromotionRemoteEntityTests.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 6/3/23.
//

import XCTest
@testable import Data

final class PromotionRemoteEntityTests: XCTestCase {

    func tests_PromotionRemoteEntity_transform_success() {
        //Given
        let promotion = MockPromotionRemoteEntity.givenPromotion1()
        //When
        let domainPromotion = promotion.transformToDomain()
        //Then
        XCTAssertNotNil(domainPromotion)
        XCTAssertEqual(promotion.productCode, domainPromotion?.productCode)
        XCTAssertEqual(promotion.name, domainPromotion?.name)
        XCTAssertEqual(promotion.type, domainPromotion?.type.rawValue)
        XCTAssertEqual(promotion.discount, domainPromotion?.discount)
        XCTAssertEqual(promotion.unitsNeeded, domainPromotion?.unitsNeeded)
    }
    
    func tests_PromotionRemoteEntity_transform_wrongType() {
        //Given
        let promotion = MockPromotionRemoteEntity.givenPromotion1(type: "unknown")
        //When
        let domainPromotion = promotion.transformToDomain()
        //Then
        XCTAssertNil(domainPromotion)
    }
    
    func tests_PromotionRemoteEntity_equatable_success() {
        //Given
        let promotion1 = MockPromotionRemoteEntity.givenPromotion1()
        let promotion2 = MockPromotionRemoteEntity.givenPromotion1()
        //When
        let result = promotion1 == promotion2
        //Then
        XCTAssertTrue(result)
    }

    func tests_PromotionRemoteEntity_equatable_false() {
        //Given
        let promotion1 = MockPromotionRemoteEntity.givenPromotion1()
        let promotion2 = MockPromotionRemoteEntity.givenPromotion2()
        //When
        let result = promotion1 == promotion2
        //Then
        XCTAssertFalse(result)
    }
}
