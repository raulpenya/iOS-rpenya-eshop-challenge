//
//  ShoppingBasketDetailView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import SwiftUI

struct ShoppingBasketDetailView: View {
    @ObservedObject var viewModel: ShoppingBasketDetailViewModel
    @Environment(\.dismiss) var dismiss
    
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
            .navigationTitle(NSLocalizedString("shopping_basket", comment: ""))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(NSLocalizedString("cancel", comment: ""), action: dismiss.callAsFunction)
                }
            }.alert(isPresented: $viewModel.dismissShoppingBasketDetail) {
                Alert(title: Text(NSLocalizedString("purchase_completed_title", comment: "")),
                    message: Text(NSLocalizedString("purchase_completed_message", comment: "")),
                    dismissButton: Alert.Button.default(
                        Text(NSLocalizedString("accept", comment: "")), action: {
                            viewModel.dismissAlertButtonPressed()
                            dismiss()
                        }
                    )
                )
            }
        }
    }
}

struct ShoppingBasketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let shoppingBasket = ShippingBasketModelPreviewProvider.getShoppingBasket()
        ShoppingBasketDetailAssemblerInjection().resolve(shoppingBasket: shoppingBasket, delegate: ProductsListAssemblerInjection().resolve().viewModel)
    }
}
