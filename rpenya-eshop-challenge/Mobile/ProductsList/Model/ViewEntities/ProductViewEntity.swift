//
//  ProductViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain

struct ProductViewEntity: Equatable {
    public let code: String
    public let name: String
    public let price: Double
    public let currency: String
    public let promotion: PromotionViewEntity?
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.code == rhs.code
    }
}

extension ProductViewEntity { //operation methods
    func getPriceString() -> String {
        return String(format: "%.2f", price) + currency + "/u"
    }
}

extension Product {
    func transformToUI() -> ProductViewEntity {
        return ProductViewEntity(code: code, name: name, price: price, currency: currency, promotion: promotion?.transformToUI())
    }
}
