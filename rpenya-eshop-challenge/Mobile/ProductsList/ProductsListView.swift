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
                
                let promotion = PromotionViewEntity(productCode: "TSHIRT", name: "Pay 1 get 2", type: .percentage, unitsNeeded: 2, discount: 0.5)
                let product = ProductViewEntity(code: "TSHIRT", name: "Cabify T-Shirt", price: 20, currency: "€", promotion: promotion)
                let item = ProductListItem(product: product)
                let listItem = ProductsListItem(items: [item])
                
                ProductsList(listItem: listItem).refreshable(action: viewModel.refreshData)
                CompleteButtonView(action: viewModel.checkoutButtonPressed)
            }.navigationTitle("eShop")
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListAssemblerInjection().resolve()
    }
}
