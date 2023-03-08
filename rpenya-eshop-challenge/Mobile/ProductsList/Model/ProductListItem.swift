//
//  ProductListItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import SwiftUI

enum ProductListItemView {
    case productsList
}

enum ProductListItemAction {
    case add
    case remove
}

struct ProductListItem: Identifiable, Equatable {
    var id = UUID()
    let basketProduct: BasketProductViewEntity
    let view: ProductListItemView
    let action: ((ProductListItem, ProductListItemAction) -> Void)?
    
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
    
    func getUnits() -> String {
        return String(basketProduct.units)
    }
    
    @ViewBuilder
    func getCell() -> some View {
        switch view {
        case .productsList:
            ProductListCellView(item: self).listRowSeparator(.hidden)
        }
    }
}
