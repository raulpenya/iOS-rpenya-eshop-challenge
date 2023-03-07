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
        return ProductsRemoteEntity(products: [MockProductRemoteEntity.givenProduct1(),MockProductRemoteEntity.givenProduct2(),MockProductRemoteEntity.givenProduct3()])
    }
}

struct MockProductRemoteEntity {
    static let code1 = "TSHIRT"
    static let name1 = "Cabify T-Shirt"
    static let price1 = 20.00
    
    static let code2 = "VOUCHER"
    static let name2 = "Cabify Voucher"
    static let price2 = 5.00
    
    static let code3 = "MUG"
    static let name3 = "Cabify Coffee Mug"
    static let price3 = 7.50
    
    static func givenProduct1() -> ProductRemoteEntity {
        return ProductRemoteEntity(code: code1, name: name1, price: price1)
    }
    
    static func givenProduct2() -> ProductRemoteEntity {
        return ProductRemoteEntity(code: code2, name: name2, price: price2)
    }
    
    static func givenProduct3() -> ProductRemoteEntity {
        return ProductRemoteEntity(code: code3, name: name3, price: price3)
    }
}
