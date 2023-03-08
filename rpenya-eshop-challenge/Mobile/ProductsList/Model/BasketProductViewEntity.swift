//
//  BasketProductViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation
import Domain

struct BasketProductViewEntity {
    let product: ProductViewEntity
    let units: Int
}

extension BasketProductViewEntity {
    func transformToProductList(action: ((ProductListItem, ProductListItemAction) -> Void)?) -> ProductListItem {
        return ProductListItem(basketProduct: self, view: .productsList, action: action)
    }
}

extension Product {
    func transformToBasketProduct() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: transformToUI(), units: 0)
    }
}
