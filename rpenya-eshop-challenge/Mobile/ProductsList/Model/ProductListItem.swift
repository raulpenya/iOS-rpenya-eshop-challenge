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
    let product: ProductViewEntity
    let units: Int
    
    func getTitle() -> String {
        return product.name
    }
    
    func getSubtitle() -> String? {
        guard let promotion = product.promotion else { return nil }
        return promotion.name
    }
    
    func getUnits() -> String {
        return String(units)
    }
    
    @ViewBuilder
    func getCell(for view: ProductListItemView) -> some View {
        switch view {
        case .productsList:
            ProductListCellView(item: self).listRowSeparator(.hidden)
        }
    }
}
