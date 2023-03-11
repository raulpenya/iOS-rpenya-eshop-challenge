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
            .navigationTitle("Shopping basket")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel", action: dismiss.callAsFunction)
                }
            }.alert(isPresented: $viewModel.dismissShoppingBasketDetail) {
                Alert(title: Text("Alert:"),
                    message: Text("press OK to execute default action..."),
                    dismissButton: Alert.Button.default(
                        Text("Press ok here"), action: {
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
