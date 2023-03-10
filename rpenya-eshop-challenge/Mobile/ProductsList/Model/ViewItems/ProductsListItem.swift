//
//  ProductsListItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import SwiftUI

enum ProductsListItemView {
    case productsList
    case shoppingBasket
}

enum ProductsListItemAction {
    case add
    case remove
}

struct ProductsListItem: ListItem {
    var id = UUID()
    let basketProduct: BasketProductViewEntity
    let view: ProductsListItemView
    let action: ((ProductsListItem, ProductsListItemAction) -> Void)?
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.basketProduct == rhs.basketProduct
    }
    
    func getTitle() -> String {
        return basketProduct.product.name
    }
    
    func getSubtitle() -> String? {
        guard let promotion = basketProduct.product.promotion else { return nil }
        return promotion.name
    }
    
    func getPrice() -> String {
        return basketProduct.product.getPriceString()
    }
    
    func getDiscountAmount() -> String {
        return basketProduct.getDiscountAmountSting()
    }
    
    func getAmount() -> String {
        return basketProduct.getAmountWithDiscountString()
    }
    
    func getUnits() -> String {
        return String(basketProduct.units)
    }
}

extension ProductsListItem {
    func transformToAnyItem() -> AnyItem {
        return  AnyItem(item: self)
    }
}
