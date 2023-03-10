//
//  MockProductViewEntity.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

struct MockProductViewEntity {
    static let code1 = "TSHIRT"
    static let name1 = "Cabify T-Shirt"
    static let price1 = 20.00
    static let currency1 = "€"
    
    static let code2 = "VOUCHER"
    static let name2 = "Cabify Voucher"
    static let price2 = 5.00
    static let currency2 = "€"
    
    static func givenProduct1(promotion: PromotionViewEntity? = MockPromotionViewEntity.givenPromotion1()) -> ProductViewEntity {
        return ProductViewEntity(code: code1, name: name1, price: price1, currency: currency1, promotion: promotion)
    }
    
    static func givenProduct2() -> ProductViewEntity {
        return ProductViewEntity(code: code2, name: name2, price: price2, currency: currency2, promotion: MockPromotionViewEntity.givenPromotion2())
    }
}
