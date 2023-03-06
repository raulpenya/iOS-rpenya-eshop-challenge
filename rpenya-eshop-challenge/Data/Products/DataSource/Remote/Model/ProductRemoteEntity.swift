//
//  ProductRemoteEntity.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain

struct ProductRemoteEntity: Decodable, Equatable {
    let code: String?
    let name: String?
    let price: Double?
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.code == rhs.code
    }
}

extension ProductRemoteEntity {
    func transformToDomain() -> Product? {
        guard let code = code,
              let name = name,
              let price = price else { return nil }
        return Product(code: code, name: name, price: price, promotion: nil)
    }
}
