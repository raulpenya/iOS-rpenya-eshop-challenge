//
//  Product.swift
//  Domain
//
//  Created by raulbot on 4/3/23.
//

import Foundation

public struct Product: Hashable, Equatable {
    public let code: String
    public let name: String
    public let price: Double
    public let currency: String
    public let promotion: Promotion?
    
    public init(code: String, name: String, price: Double, currency: String = "€", promotion: Promotion?) {
        self.code = code
        self.name = name
        self.price = price
        self.currency = currency
        self.promotion = promotion
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.code == rhs.code
    }
    
    public func hash(into hasher: inout Hasher) {
        code.hash(into: &hasher)
    }
}

extension Product {
    func addPromotion(_ promotion: Promotion) -> Product {
        return Product(code: code, name: name, price: price, promotion: promotion)
    }
}
