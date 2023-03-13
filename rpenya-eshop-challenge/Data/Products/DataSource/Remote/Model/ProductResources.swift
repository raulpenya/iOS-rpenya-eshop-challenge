//
//  ProductResources.swift
//  Data
//
//  Created by raulbot on 6/3/23.
//

import Foundation
import Domain

struct ProductResources {
    static func getAllProductsResource() -> Resource<ProductsRemoteEntity, Products>? {
        guard let urlRequest = try? ProductsApi.getAllProducts.asURLRequest() else { return nil }
        return Resource<ProductsRemoteEntity, Products>(request: urlRequest) { products in
            return products.transformToDomain()
        }
    }
}
