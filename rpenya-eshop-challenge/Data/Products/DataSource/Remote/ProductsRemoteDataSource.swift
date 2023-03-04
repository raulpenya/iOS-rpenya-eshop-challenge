//
//  ProductsRemoteDataSource.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

class ProductsRemoteDataSource: ProductsDataSource, NetworkingDataSource {
    func getAllProducts() -> AnyPublisher<[Domain.Product], Error> {
        do {
            let urlRequest = try ProductsApi.getAllProducts.asURLRequest()
            let resource = Resource<ProductsRemoteEntity, [Product]>(request: urlRequest) { products in
                return products.transformToDomain()
            }
            return request(with: URLSession.shared, resource: resource)
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
