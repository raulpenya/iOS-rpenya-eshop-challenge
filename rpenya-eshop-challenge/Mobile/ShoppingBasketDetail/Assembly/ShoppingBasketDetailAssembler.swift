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
    func resolve() -> ShoppingBasketDetailView
}

extension ShoppingBasketDetailAssembler {
    func resolve() -> ShoppingBasketDetailView {
        return ShoppingBasketDetailView()
    }
}

class ShoppingBasketDetailAssemblerInjection: ShoppingBasketDetailAssembler {}
