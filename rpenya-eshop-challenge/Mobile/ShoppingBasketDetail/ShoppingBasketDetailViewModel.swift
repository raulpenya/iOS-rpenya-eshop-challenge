//
//  ShoppingBasketDetailViewModel.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation

class ShoppingBasketDetailViewModel: ObservableObject {
    @Published private(set) var state = State.idle
    let currentShoppingBasket: ShoppingBasketViewEntity
    
    init(state: State = State.idle, currentShoppingBasket: ShoppingBasketViewEntity) {
        self.state = state
        self.currentShoppingBasket = currentShoppingBasket
    }
    
    func loadData() {
        updateView(with: currentShoppingBasket)
    }
    
    func checkoutButtonPressed(item: ButtonItem) {
        
    }
    
    func updateView(with shoppingBasket: ShoppingBasketViewEntity) {
        let listItems = shoppingBasket.transformToShoppingBasketList(view: .shoppingBasket)
        let buttonItem = shoppingBasket.transformToProductListButtonItem(action: checkoutButtonPressed)
        state = .loaded(listItems, buttonItem)
    }
}
