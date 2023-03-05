//
//  MockProductEntities.swift
//  Data
//
//  Created by raulbot on 5/3/23.
//

import Foundation
@testable import Data

struct MockProductsRemoteEntity {
    static func givenProducts() -> ProductsRemoteEntity {
        return ProductsRemoteEntity(products: [MockProductRemoteEntity.givenProduct(),MockProductRemoteEntity.givenProduct(),MockProductRemoteEntity.givenProduct()])
    }
}

struct MockProductRemoteEntity {
    static let code = "TSHIRT"
    static let name = "Cabify T-Shirt"
    static let price = 7.5
    
    static func givenProduct() -> ProductRemoteEntity {
        return ProductRemoteEntity(code: code, name: name, price: price)
    }
}
