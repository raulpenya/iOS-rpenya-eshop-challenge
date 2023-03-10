//
//  ProductsListRouter.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import SwiftUI

class ProductsListRouter: Router {
    typealias T = ShoppingBasketDetailView
    typealias Q = ShoppingBasketDetailDependencies
    
    func destination(_ dependencies: ShoppingBasketDetailDependencies) -> ShoppingBasketDetailView {
        return ShoppingBasketDetailAssemblerInjection().resolve()
    }
}

class ShoppingBasketDetailDependencies: Dependecies {
    public init() {}
}
