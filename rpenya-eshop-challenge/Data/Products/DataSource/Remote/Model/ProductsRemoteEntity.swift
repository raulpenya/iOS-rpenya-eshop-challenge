//
//  ProductsRemoteEntity.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain

struct ProductsRemoteEntity: Decodable {
    let products: [ProductRemoteEntity]
}

extension ProductsRemoteEntity {
    func transformToDomain() -> Products {
        return Products(products: products.compactMap { $0.transformToDomain() }).removeDuplicates()
    }
}
