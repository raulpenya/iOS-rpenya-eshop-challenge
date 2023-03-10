//
//  ShoppingBasketDetailAssembler.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation
import Domain
import Data

protocol ShoppingBasketDetailAssembler {
    func resolve(basket: BasketViewEntity) -> ShoppingBasketDetailView
}

extension ShoppingBasketDetailAssembler {
    func resolve(basket: BasketViewEntity) -> ShoppingBasketDetailView {
        return ShoppingBasketDetailView(viewModel: resolve(basket: basket))
    }
    
    func resolve(basket: BasketViewEntity) -> ShoppingBasketDetailViewModel {
        return ShoppingBasketDetailViewModel(currentBasket: basket)
    }
}

class ShoppingBasketDetailAssemblerInjection: ShoppingBasketDetailAssembler {}
