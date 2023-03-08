//
//  ProductsListItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import SwiftUI

struct ProductsListItem {
    let items: [ProductListItem]
    
    @ViewBuilder
    func getList() -> some View {
        ProductsList(listItem: self)
    }
}
