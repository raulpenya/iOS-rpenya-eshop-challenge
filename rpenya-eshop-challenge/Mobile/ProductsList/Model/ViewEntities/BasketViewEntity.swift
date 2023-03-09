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
    func transformToProductsList(action: ((ProductsListItem, ProductsListItemAction) -> Void)?) -> ListItems {
        return ProductsListItems(items: products.compactMap { $0.transformToProductsListItem(action: action).transformToAnyItem() })
    }
    
    func transformToProductListButtonItem(action: @escaping ((ButtonItem) -> Void)) -> ButtonItem {
        return ProductsListButtonItem(title: NSLocalizedString("proceed_checkout", comment: ""), isDisabled: isEmpty(), action: action)
    }
}

extension BasketViewEntity {
    func isEmpty() -> Bool {
        return products.reduce(0) { partialResult, product in
            partialResult+product.units
        } == 0
    }
}

extension Products {
    func transformToBasket() -> BasketViewEntity {
        return BasketViewEntity(products: products.compactMap { $0.transformToBasketProduct() })
    }
}
