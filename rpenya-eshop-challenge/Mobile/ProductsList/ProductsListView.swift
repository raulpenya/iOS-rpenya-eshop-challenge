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
    let router: ProductsListRouter
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .idle:
                    Color.clear.onAppear(perform: viewModel.loadData)
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(errorMessage: error.text, action: viewModel.refreshData)
                case .loaded(let listItems, let buttonItem):
                    PlainListView(listItems: listItems).refreshable(action: viewModel.refreshData).accessibilityIdentifier("products_list")
                    CompleteButtonView(item: buttonItem)
                        .accessibilityIdentifier("product_list_complete_button")
                }
            }
            .navigationTitle(NSLocalizedString("eshop", comment: ""))
            .sheet(isPresented: $viewModel.presentShoppingBasketDetail) {
                if let dependencies = viewModel.transformToShoppingBasketDetailDependencies() {
                    router.destination(dependencies)
                }
            }
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListAssemblerInjection().resolve()
    }
}
