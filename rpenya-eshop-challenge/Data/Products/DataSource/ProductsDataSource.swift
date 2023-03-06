//
//  ProductsDataSource.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Combine

protocol ProductsDataSource {
    func getAllProducts() -> AnyPublisher<[Domain.Product], Error>
}
