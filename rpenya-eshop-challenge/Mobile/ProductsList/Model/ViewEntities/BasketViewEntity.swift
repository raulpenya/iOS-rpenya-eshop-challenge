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
    func transformToProductsList(action: ((ProductsListItem, ProductsListItemAction) -> Void)?) -> ProductsListItems {
        return ProductsListItems(items: products.compactMap { $0.transformToProductsListItem(action: action).transformToAnyItem() })
    }
    
    func transformToProductListButtonItem(action: @escaping ((ButtonItem) -> Void)) -> ProductListButtonItem {
        let isDisbled = false
        return ProductListButtonItem(title: NSLocalizedString("proceed_checkout", comment: ""), isDisabled: isDisbled, action: action)
    }
}

extension BasketViewEntity {
    func isEmpty() -> Bool {
        return true
    }
}

extension Products {
    func transformToBasket() -> BasketViewEntity {
        return BasketViewEntity(products: products.compactMap { $0.transformToBasketProduct() })
    }
}
