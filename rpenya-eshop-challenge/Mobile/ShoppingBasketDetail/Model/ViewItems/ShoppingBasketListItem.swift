//
//  ShoppingBasketListItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 10/3/23.
//

import Foundation

protocol ProductListItem: ListItem {
    var basketProduct: BasketProductViewEntity { get set }
    var view: ProductsListItemView { get set }
}

struct ShoppingBasketListItem: ProductListItem, Equatable {
    var id = UUID()
    var basketProduct: BasketProductViewEntity
    var view: ProductsListItemView
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.basketProduct == rhs.basketProduct && lhs.view == rhs.view
    }
    
    func getTitle() -> String {
        return basketProduct.product.name
    }
    
    func getPrice() -> String {
        return basketProduct.product.getPriceString()
    }
    
    func getUnits() -> String {
        return String(basketProduct.units)
    }
    
    func getAmount() -> String {
        return basketProduct.getAmountWithDiscountString()
    }
    
    func getSubtitle() -> String? {
        guard let promotion = basketProduct.product.promotion else { return nil }
        return promotion.name
    }
    
    func getDiscountAmount() -> String? {
        guard basketProduct.getDiscountAmount() < 0 else { return nil }
        return basketProduct.getDiscountAmountSting()
    }
}
