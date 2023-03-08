//
//  ProductListItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import SwiftUI

struct ProductListItem: Identifiable {
    
    enum ProductListItemView {
        case productsList
    }
    
    var id = UUID()
    let basketProduct: BasketProductViewEntity
    let view: ProductListItemView
//    let action: ((ProductListItem) -> Void)?
    
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
