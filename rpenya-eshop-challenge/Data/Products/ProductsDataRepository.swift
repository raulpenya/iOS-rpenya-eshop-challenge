//
//  ProductsDataRepository.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

struct ProductsDataRepository: ProductsRepository {
    
    let dataSource: ProductsDataSource
    
    func getAllProducts() -> AnyPublisher<[Domain.Product], Error> {
        return dataSource.getAllProducts()
    }
}
