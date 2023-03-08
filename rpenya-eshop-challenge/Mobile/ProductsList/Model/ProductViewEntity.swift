//
//  ProductViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain

struct ProductViewEntity {
    public let code: String
    public let name: String
    public let price: Double
    public let currency: String
    public let promotion: PromotionViewEntity?
}

extension Product {
    func transformToUI() -> ProductViewEntity {
        return ProductViewEntity(code: code, name: name, price: price, currency: currency, promotion: promotion?.transformToUI())
    }
}
