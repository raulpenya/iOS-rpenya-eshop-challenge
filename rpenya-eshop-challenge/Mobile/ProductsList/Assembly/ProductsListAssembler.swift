//
//  ProductsListAssembler.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Data

protocol ProductsListAssembler {
    func resolve() -> ProductsListView
}

extension ProductsListAssembler {
    func resolve() -> ProductsListView {
        return ProductsListView(viewModel: resolve(), router: resolve())
    }
    
    func resolve() -> ProductsListRouter {
        return ProductsListRouter()
    }
    
    func resolve() -> ProductsListViewModel {
        return ProductsListViewModel(getProductsWithPromotionsUseCase: resolve())
    }
    
    func resolve() -> GetProductsWithPromotions {
        return GetProductsWithPromotions(productsRepository: resolve(), promotionsRepository: resolve())
    }
    
    func resolve() -> ProductsRepository {
        return ProductsDataRepository(dataSource: ProductsRemoteDataSource())
    }
    
    func resolve() -> PromotionsRepository {
        return PromotionsDataRepository(dataSource: PromotionsRemoteDataSource())
    }
}

class ProductsListAssemblerInjection: ProductsListAssembler {}
