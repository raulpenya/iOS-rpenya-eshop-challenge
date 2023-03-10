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
                    Text(error.text)
                case .loaded(let listItems, let buttonItem):
                    PlainListView(listItems: listItems).refreshable(action: viewModel.refreshData)
                    CompleteButtonView(item: buttonItem)
                }
            }
            .navigationTitle("eShop")
            .sheet(isPresented: $viewModel.presentShoppingBasketDetail) {
                router.destination(ShoppingBasketDetailDependencies())
            }
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListAssemblerInjection().resolve()
    }
}
