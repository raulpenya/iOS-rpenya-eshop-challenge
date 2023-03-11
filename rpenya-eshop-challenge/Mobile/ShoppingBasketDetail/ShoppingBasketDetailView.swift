//
//  ShoppingBasketDetailView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import SwiftUI

struct ShoppingBasketDetailView: View {
    @ObservedObject var viewModel: ShoppingBasketDetailViewModel
    
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
                    PlainListView(listItems: listItems)
                    CompleteButtonView(item: buttonItem)
                }
            }
            .navigationTitle("Shopping basket")
        }
    }
}

struct ShoppingBasketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let shoppingBasket = ShippingBasketModelPreviewProvider.getShoppingBasket()
        ShoppingBasketDetailAssemblerInjection().resolve(shoppingBasket: shoppingBasket)
    }
}
