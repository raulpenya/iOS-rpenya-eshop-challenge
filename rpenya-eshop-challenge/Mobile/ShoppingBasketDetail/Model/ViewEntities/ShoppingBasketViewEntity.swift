//
//  ShoppingBasketViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 11/3/23.
//

import Foundation

struct ShoppingBasketViewEntity {
    let products: [BasketProductViewEntity]
    let currency: String
    let price: Double
    let priceWithoutDiscount: Double
}

extension ShoppingBasketViewEntity {
    func transformToShoppingBasketList(view: ProductsListItemView = .shoppingBasket) -> ListItems {
        return ShoppingBasketListItems(items: products.compactMap { $0.transformToShoppingBasketListItem(view: view).transformToAnyItem() })
    }
    
    func transformToProductListButtonItem(action: @escaping ((ButtonItem) -> Void)) -> ButtonItem {
        return ProductsListButtonItem(title: NSLocalizedString("proceed_checkout", comment: ""), isDisabled: false, action: action, price: price.toPriceString(with: currency), priceWithoutDiscount: priceWithoutDiscount.toPriceString(with: currency))
    }
}
