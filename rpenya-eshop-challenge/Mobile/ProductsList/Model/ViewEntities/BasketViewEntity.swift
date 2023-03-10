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
    let currency: String
}

extension BasketViewEntity { //transform methods
    func transformToProductsList(action: ((ProductsListItem, ProductsListItemAction) -> Void)?) -> ListItems {
        return ProductsListItems(items: products.compactMap { $0.transformToProductsListItem(action: action).transformToAnyItem() })
    }
    
    func transformToProductListButtonItem(action: @escaping ((ButtonItem) -> Void)) -> ButtonItem {
        var title = NSLocalizedString("proceed_checkout", comment: "")
        if let price = getBasketPriceString() {
            title = title + "\n" + price
        }
        return ProductsListButtonItem(title: title, isDisabled: isEmpty(), action: action)
    }
}

extension BasketViewEntity { //operation methods
    func isEmpty() -> Bool {
        return products.reduce(0) { partialResult, product in
            partialResult+product.units
        } == 0
    }
    
    func modifyProductUnits(_ product: BasketProductViewEntity, action: BasketProductAction) -> BasketViewEntity {
        var products = products
        var newBasket = self
        if let index = products.firstIndex(where: { $0.product == product.product }) {
            products[index] = products[index].modifyUnits(action)
            newBasket = BasketViewEntity(products: products, currency: newBasket.currency)
        }
        return newBasket
    }
    
    func getBasketPriceString() -> String? {
        let price = products.reduce(0) { partialResult, product in
            return partialResult+product.getAmountWithDiscount()
        }
        return price > 0 ? String(format: "%.2f", price)+currency : nil
    }
}

extension Products {
    func transformToBasket() -> BasketViewEntity {
        var currency = ""
        let products = products.compactMap { product in
            currency = product.currency
            return product.transformToBasketProduct()
        }
        return BasketViewEntity(products: products, currency: currency)
    }
}
