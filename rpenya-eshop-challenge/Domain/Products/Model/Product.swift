//
//  Product.swift
//  Domain
//
//  Created by raulbot on 4/3/23.
//

import Foundation

public struct Product: Equatable {
    public let code: String
    public let name: String
    public let price: Double
    public let currency: String = "€"
    
    public init(code: String, name: String, price: Double, currency: String = "€") {
        self.code = code
        self.name = name
        self.price = price
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.code == rhs.code
    }
}
