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
        return request(resource: ProductResources.getAllProductsResource())
    }
}
