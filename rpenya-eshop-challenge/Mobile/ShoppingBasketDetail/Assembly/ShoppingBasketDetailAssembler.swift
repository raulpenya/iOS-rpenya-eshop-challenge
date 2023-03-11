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
    func resolve(shoppingBasket: ShoppingBasketViewEntity) -> ShoppingBasketDetailView
}

extension ShoppingBasketDetailAssembler {
    func resolve(shoppingBasket: ShoppingBasketViewEntity) -> ShoppingBasketDetailView {
        return ShoppingBasketDetailView(viewModel: resolve(shoppingBasket: shoppingBasket))
    }
    
    func resolve(shoppingBasket: ShoppingBasketViewEntity) -> ShoppingBasketDetailViewModel {
        return ShoppingBasketDetailViewModel(currentShoppingBasket: shoppingBasket)
    }
}

class ShoppingBasketDetailAssemblerInjection: ShoppingBasketDetailAssembler {}
