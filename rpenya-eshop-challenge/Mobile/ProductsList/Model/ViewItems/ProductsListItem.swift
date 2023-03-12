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

struct ProductsListItem: ProductListItem, Equatable {
    var id = UUID()
    var basketProduct: BasketProductViewEntity
    var view: ProductsListItemView
    let action: ((ProductsListItem, ProductsListItemAction) -> Void)?
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.basketProduct == rhs.basketProduct && lhs.view == rhs.view
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
    
    func getUnits() -> String {
        return String(basketProduct.units)
    }
}
