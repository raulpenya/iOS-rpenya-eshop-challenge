//
//  ProductsListView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import SwiftUI
import Domain

struct ProductsListView: View {
    @ObservedObject var viewModel: ProductsListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                let listItem = ProductsListModelPreviewProvider.getProductsListItem()
                listItem.getList().refreshable(action: viewModel.refreshData)
                let buttonItem = ButtonItemModelPreviewProvider.givenButtonItem()
                CompleteButtonView(item: buttonItem)
            }.navigationTitle("eShop")
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListAssemblerInjection().resolve()
    }
}
