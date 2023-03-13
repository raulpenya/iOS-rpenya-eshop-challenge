//
//  BasketProductViewEntity.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation
import Domain

enum BasketProductAction {
    case addProduct
    case removeProduct
}

struct BasketProductViewEntity: Equatable {
    let product: ProductViewEntity
    var units: Int
    
    static let max_units = 99
    static let min_units = 0
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.product == rhs.product
    }
}

extension BasketProductViewEntity { //transform methods
    func transformToProductsListItem(view: ProductsListItemView = .productsList, action: @escaping ((ProductsListItem, ProductsListItemAction) -> Void)) -> ListItem {
        return ProductsListItem(basketProduct: self, view: view, action: action)
    }
    
    func transformToShoppingBasketListItem(view: ProductsListItemView = .shoppingBasket) -> ListItem {
        return ShoppingBasketListItem(basketProduct: self, view: view)
    }
}

extension BasketProductViewEntity { //operation methods
    func modifyUnits(_ action: BasketProductAction) -> BasketProductViewEntity {
        var newBasketProduct = self
        switch action {
        case .addProduct:
            if newBasketProduct.units < BasketProductViewEntity.max_units { newBasketProduct.units += 1 }
        case .removeProduct:
            if newBasketProduct.units > BasketProductViewEntity.min_units { newBasketProduct.units -= 1 }
        }
        return newBasketProduct
    }
    
    func getDiscountAmountSting() -> String {
        return getDiscountAmount().toPriceString(with: product.currency)
    }
    
    func getAmountWithDiscountString() -> String {
        return getAmountWithDiscount().toPriceString(with: product.currency)
    }
    
    func getDiscountAmount() -> Double {
        return getAmountWithDiscount() - getAmountWithoutDiscount()
    }
    
    func getAmountWithoutDiscount() -> Double {
        return product.price*Double(units)
    }
    
    func getAmountWithDiscount() -> Double {
        var amount: Double = 0
        if let promotion = product.promotion {
            switch promotion.type {
            case .percentage:
                amount = getAmountWithPercentageDiscount()
            case .newprice:
                amount = getAmountWithNewPriceDiscount()
            }
        } else {
            amount = product.price*Double(units)
        }
        return amount
    }
    
    func getAmountWithPercentageDiscount() -> Double {
        var amount: Double = 0
        if let promotion = product.promotion, promotion.type == .percentage {
            let groupedPrice = product.price*Double(promotion.unitsNeeded)*promotion.discount
            let unitsGrouped = modf(Double(units)/Double(promotion.unitsNeeded))
            amount = unitsGrouped.1*Double(promotion.unitsNeeded)*product.price
            amount = amount + unitsGrouped.0*groupedPrice
        }
        return amount
    }
    
    func getAmountWithNewPriceDiscount() -> Double {
        var amount: Double = 0
        if let promotion = product.promotion, promotion.type == .newprice, units >= promotion.unitsNeeded {
            amount = promotion.discount*Double(units)
        } else {
            amount = product.price*Double(units)
        }
        return amount
    }
}

extension Product {
    func transformToBasketProduct() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: transformToUI(), units: 0)
    }
}
