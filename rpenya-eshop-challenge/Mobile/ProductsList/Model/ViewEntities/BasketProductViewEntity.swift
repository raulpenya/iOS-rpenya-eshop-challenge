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
    func transformToProductsListItem(view: ProductsListItemView = .productsList, action: ((ProductsListItem, ProductsListItemAction) -> Void)?) -> ProductsListItem {
        return ProductsListItem(basketProduct: self, view: view, action: action)
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
    
    func getPriceAmount() -> Double {
        return product.price*Double(units)
    }
}

extension Product {
    func transformToBasketProduct() -> BasketProductViewEntity {
        return BasketProductViewEntity(product: transformToUI(), units: 0)
    }
}
