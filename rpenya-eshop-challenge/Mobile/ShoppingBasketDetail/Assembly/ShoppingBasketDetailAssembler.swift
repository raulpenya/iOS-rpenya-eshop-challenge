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
    func resolve(shoppingBasket: ShoppingBasketViewEntity, delegate: ShoppingBasketDetailDelegate) -> ShoppingBasketDetailView
}

extension ShoppingBasketDetailAssembler {
    func resolve(shoppingBasket: ShoppingBasketViewEntity, delegate: ShoppingBasketDetailDelegate) -> ShoppingBasketDetailView {
        return ShoppingBasketDetailView(viewModel: resolve(shoppingBasket: shoppingBasket, delegate: delegate))
    }
    
    func resolve(shoppingBasket: ShoppingBasketViewEntity, delegate: ShoppingBasketDetailDelegate) -> ShoppingBasketDetailViewModel {
        return ShoppingBasketDetailViewModel(currentShoppingBasket: shoppingBasket, delegate: delegate)
    }
}

class ShoppingBasketDetailAssemblerInjection: ShoppingBasketDetailAssembler {}
