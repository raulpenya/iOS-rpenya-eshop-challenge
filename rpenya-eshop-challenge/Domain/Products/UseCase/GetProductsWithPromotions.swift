//
//  GetProductsWithPromotions.swift
//  Domain
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Combine

public class GetProductsWithPromotions: UseCase {
    typealias T = Products
    typealias Q = GetProductsWithPromotionsRequestValues
    let productsRepository: ProductsRepository
    let promotionsRepository: PromotionsRepository
    
    public init(productsRepository: ProductsRepository, promotionsRepository: PromotionsRepository) {
        self.productsRepository = productsRepository
        self.promotionsRepository = promotionsRepository
    }
    
    public func execute(_ requestValues: GetProductsWithPromotionsRequestValues) -> AnyPublisher<Products, Error> {
        let productsPublisher = productsRepository.getAllProducts()
        let promotionsPublisher = promotionsRepository.getAllPromotions()
            .catch { _ in
            return Result<Promotions, Error>.Publisher(Promotions(promotions: [])).eraseToAnyPublisher()
        }
        return Publishers.Zip(productsPublisher, promotionsPublisher).flatMap { products, promotion in
            return Result<Products, Error>.Publisher(products.linkPromotions(promotion)).eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}

public class GetProductsWithPromotionsRequestValues: RequestValues {
    public init() {}
}
