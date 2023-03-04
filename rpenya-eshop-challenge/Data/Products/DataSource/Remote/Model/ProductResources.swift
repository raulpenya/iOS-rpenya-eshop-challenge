//
//  ProductResources.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain

enum ProductResources {
    case getAllProducts

    func asResource() throws -> any ResourceP {
        switch self {
        case .getAllProducts:
            let request = try ProductsApi.getAllProducts.asURLRequest()
            let resource = GetAllProductsResource(request: request) { products in
                return products.transformToDomain()
            }
            return resource
        }
    }
}

struct GetAllProductsResource: ResourceP {
    typealias T = ProductsRemoteEntity
    typealias Q = [Product]
    var request: URLRequest
    var transform: (ProductsRemoteEntity) -> [Domain.Product]
}
