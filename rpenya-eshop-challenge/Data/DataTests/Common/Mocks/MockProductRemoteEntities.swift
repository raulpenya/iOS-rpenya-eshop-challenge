//
//  MockProductEntities.swift
//  Data
//
//  Created by raulbot on 5/3/23.
//

import Foundation
@testable import Data

struct MockProductsRemoteEntity {
    static func getProductRemoteEntity() -> ProductsRemoteEntity {
        return ProductsRemoteEntity(products: [MockProductRemoteEntity.getProductRemoteEntity()])
    }
}

struct MockProductRemoteEntity {
    static func getProductRemoteEntity() -> ProductRemoteEntity {
        return ProductRemoteEntity(code: "", name: "", price: 0)
    }
}
