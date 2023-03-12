//
//  ShoppingBasketModelPreviewProvider.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 11/3/23.
//

#if DEBUG

import Foundation

struct ShoppingBasketModelPreviewProvider {
    static func getShoppingBasket() -> ShoppingBasketViewEntity {
        return ShoppingBasketViewEntity(products: [ProductsListModelPreviewProvider.getBasketProduct1(), ProductsListModelPreviewProvider.getBasketProduct2()], currency: "€", price: 45.00, priceWithoutDiscount: 60.00)
    }
}

#endif
