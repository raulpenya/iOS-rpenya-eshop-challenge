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
    
    static func givenProductsNil() -> ProductsRemoteEntity {
        return ProductsRemoteEntity(products: nil)
    }
}

struct MockProductRemoteEntity {
    static let code1 = "TSHIRT"
    static let name1 = "Cabify T-Shirt"
    static let price1 = 7.5
    
    static let code2 = "VOUCHER"
    static let name2 = "Cabify Voucher"
    static let price2 = 5
    
    static func givenProduct(code: String = MockProductRemoteEntity.code1, name: String = MockProductRemoteEntity.name1, price: Double = MockProductRemoteEntity.price1) -> ProductRemoteEntity {
        return ProductRemoteEntity(code: code, name: name, price: price)
    }
    
    static func givenProductNil() -> ProductRemoteEntity {
        return ProductRemoteEntity(code: nil, name: nil, price: nil)
    }
}
