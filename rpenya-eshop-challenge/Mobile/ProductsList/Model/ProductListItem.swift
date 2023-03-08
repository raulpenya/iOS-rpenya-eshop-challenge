//
//  ProductListItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import SwiftUI

struct ProductListItem: Identifiable {
    var id = UUID()
    let product: ProductViewEntity
    
    func getTitle() -> String {
        return product.name
    }
    
    func getSubtitle() -> String? {
        guard let promotion = product.promotion else { return nil }
        return promotion.name
    }
    
    @ViewBuilder
    func getCell() -> some View {
        ProductListCell(item: self).listRowSeparator(.hidden)
    }
}
