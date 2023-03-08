//
//  BasketProductViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation
import Domain

struct BasketProductViewEntity: Equatable {
    let product: ProductViewEntity
    let units: Int
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.product == rhs.product
    }
}

extension BasketProductViewEntity {
    func transformToProductListItem(view: ProductListItemView = .productsList, action: ((ProductListItem, ProductListItemAction) -> Void)?) -> ProductListItem {
        return ProductListItem(basketProduct: self, view: view, action: action)
    }
}

extension Product {
    func transformToBasketProduct() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: transformToUI(), units: 0)
    }
}
