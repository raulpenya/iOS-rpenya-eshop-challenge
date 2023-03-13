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
                    ErrorView(errorMessage: error.text, action: viewModel.refreshData)
                case .loaded(let listItems, let buttonItem):
                    PlainListView(listItems: listItems).accessibilityIdentifier(AccessibilityIdentifierConstants.shoppingBasketList)
                    CompleteButtonView(item: buttonItem).accessibilityIdentifier(AccessibilityIdentifierConstants.shoppingBasketCompleteButton)
                }
            }
            .navigationTitle(NSLocalizedString("shopping_basket", comment: ""))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(NSLocalizedString("cancel", comment: ""), action: dismiss.callAsFunction).accessibilityIdentifier(AccessibilityIdentifierConstants.cancelButton)
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
        let shoppingBasket = ShoppingBasketModelPreviewProvider.getShoppingBasket()
        ShoppingBasketDetailAssemblerInjection().resolve(shoppingBasket: shoppingBasket, delegate: ProductsListAssemblerInjection().resolve().viewModel)
    }
}
