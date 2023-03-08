//
//  BasketViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation
import Domain

struct BasketViewEntity {
    let products: [BasketProductViewEntity]
}

extension BasketViewEntity {
    func transformToProductsList(action: ((ProductListItem, ProductListItemAction) -> Void)?) -> ProductsListItem {
        return ProductsListItem(items: products.compactMap { $0.transformToProductListItem(action: action) })
    }
}

extension Products {
    func transformToBasket() -> BasketViewEntity {
        return BasketViewEntity(products: products.compactMap { $0.transformToBasketProduct() })
    }
}
