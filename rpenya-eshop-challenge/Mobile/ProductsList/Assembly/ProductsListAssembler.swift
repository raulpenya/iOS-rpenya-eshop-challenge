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
        return ProductsListView(viewModel: resolve())
    }
    
//    func resolve() -> MissionResultRouter {
//        return MissionResultRouter()
//    }
    
    func resolve() -> ProductsListViewModel {
        return ProductsListViewModel()
    }
}

class ProductsListAssemblerInjection: ProductsListAssembler {}
