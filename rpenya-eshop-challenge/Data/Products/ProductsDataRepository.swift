//
//  ProductsDataRepository.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

public struct ProductsDataRepository: ProductsRepository {
    
    let dataSource: ProductsDataSource
    
    public init(dataSource: ProductsDataSource) {
        self.dataSource = dataSource
    }
    
    public func getAllProducts() -> AnyPublisher<Domain.Products, Error> {
        return dataSource.getAllProducts()
    }
}
