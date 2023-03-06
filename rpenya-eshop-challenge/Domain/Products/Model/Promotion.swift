//
//  Promotion.swift
//  Domain
//
//  Created by raulbot on 4/3/23.
//

import Foundation

//{
//      "productCode": "VOUCHER",
//      "name": "Pay 1 get 2",
//      "type": "PERCENTAGE",
//      "unitsNeeded": 2,
//      "discount": 0.50
//    }

public enum PromotionType: String, Equatable {
    case percentage = "PERCENTAGE"
    case newprice = "NEWPRICE"
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

public struct Promotion: Equatable {
    public let productCode: String
    public let name: String
    public let type: PromotionType
    public let unitsNeeded: Int
    public let discount: Double
    
    public init(productCode: String, name: String, type: PromotionType, unitsNeeded: Int, discount: Double) {
        self.productCode = productCode
        self.name = name
        self.type = type
        self.unitsNeeded = unitsNeeded
        self.discount = discount
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.productCode == rhs.productCode
    }
}
