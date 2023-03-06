//
//  GetProductsWithPromotions.swift
//  Domain
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Combine

public class GetProductsWithPromotions: UseCase {
    typealias T = [Product]
    typealias Q = GetProductsWithPromotionsRequestValues
    let productsRepository: ProductsRepository
    let promotionsRepository: PromotionsRepository
    
    public init(productsRepository: ProductsRepository, promotionsRepository: PromotionsRepository) {
        self.productsRepository = productsRepository
        self.promotionsRepository = promotionsRepository
    }
    
    func execute(_ requestValues: GetProductsWithPromotionsRequestValues) -> AnyPublisher<[Product], Error> {
        let productPublisher = productsRepository.getAllProducts()
        let promotionsPublisher = promotionsRepository.getAllPromotions()
        return Publishers.Zip(productPublisher, promotionsPublisher).flatMap { products, promotion in
            return Result<[Product], Error>.Publisher(products).eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}

public class GetProductsWithPromotionsRequestValues: RequestValues {}
