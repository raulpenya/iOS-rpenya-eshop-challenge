//
//  ProductCells.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 10/3/23.
//

import SwiftUI

struct ProductCells: View {
    let item: ProductListItem
    var body: some View {
        switch item.view {
        case .productsList:
            ProductListCellView(item: item).listRowSeparator(.hidden)
        case .shoppingBasket:
            BasketItemCellView(item: item).listRowSeparator(.hidden)
        }
    }
}
