//
//  ProductsRemoteDataSource.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

public class ProductsRemoteDataSource: ProductsDataSource, NetworkingDataSource {
    
    public init() {}
    
    public func getAllProducts() -> AnyPublisher<Domain.Products, Error> {
        return request(resource: ProductResources.getAllProductsResource())
    }
}
