//
//  PlainListView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 9/3/23.
//

import  SwiftUI

struct PlainListView: View {
    let listItem: ListItems
    
    var body: some View {
        List (listItem.items) { anyItem in
            if let item = anyItem.item as? ProductsListItem {
                ProductCells(item: item)
            }
        }.listStyle(.plain)
    }
}

struct PlainList_Previews: PreviewProvider {
    static var previews: some View {
        PlainListView(listItem: ProductsListModelPreviewProvider.getProductsListItem())
    }
}
