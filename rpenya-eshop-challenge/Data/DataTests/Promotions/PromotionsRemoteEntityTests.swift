//
//  PromotionsRemoteEntityTests.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 6/3/23.
//

import XCTest
@testable import Data

final class PromotionsRemoteEntityTests: XCTestCase {
    func tests_PromotionsRemoteEntity_decode() {
        //Given
        let json = String.getPromotionsSuccessResponse()
        //When
        let jsonData = json.data(using: .utf8)!
        let promotions: PromotionsRemoteEntity? = try? JSONDecoder().decode(PromotionsRemoteEntity.self, from: jsonData)
        //Then
        XCTAssertNotNil(promotions)
        XCTAssertFalse(promotions!.promotions.isEmpty)
        XCTAssertEqual(promotions!.promotions[0].productCode, "VOUCHER")
        XCTAssertEqual(promotions!.promotions[0].name, "Pay1get2")
        XCTAssertEqual(promotions!.promotions[0].type, "PERCENTAGE")
        XCTAssertEqual(promotions!.promotions[0].unitsNeeded, 2)
        XCTAssertEqual(promotions!.promotions[0].discount, 0.50)
    }
    
    func tests_PromotionsRemoteEntity_transform_success() {
        //Given
        let promotions = MockPromotionsRemoteEntity.givenPromotions()
        //When
        let domainPromotions = promotions.transformToDomain()
        //Then
        XCTAssertEqual(promotions.promotions.count, domainPromotions.promotions.count)
        XCTAssertEqual(promotions.promotions[0].productCode, domainPromotions.promotions[0].productCode)
        XCTAssertEqual(promotions.promotions[0].name, domainPromotions.promotions[0].name)
        XCTAssertEqual(promotions.promotions[0].type, domainPromotions.promotions[0].type.rawValue)
        XCTAssertEqual(promotions.promotions[0].unitsNeeded, domainPromotions.promotions[0].unitsNeeded)
        XCTAssertEqual(promotions.promotions[0].discount, domainPromotions.promotions[0].discount)
    }
    
    func tests_PromotionsRemoteEntity_transform_wrongType() {
        //Given
        let promotions = MockPromotionsRemoteEntity.givenPromotions(unknownType: true)
        //When
        let domainPromotions = promotions.transformToDomain()
        //Then
        XCTAssertNotEqual(promotions.promotions.count, domainPromotions.promotions.count)
        XCTAssertTrue(promotions.promotions.count > domainPromotions.promotions.count)
        XCTAssertEqual(promotions.promotions.count, 2)
        XCTAssertEqual(domainPromotions.promotions.count, 1)
    }
}
