//
//  ShoppingBasketDetailViewModel.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation

class ShoppingBasketDetailViewModel: ObservableObject {
    @Published private(set) var state = State.idle
    let currentBasket: BasketViewEntity
    
    init(state: State = State.idle, currentBasket: BasketViewEntity) {
        self.state = state
        self.currentBasket = currentBasket
    }
    
    func loadData() {
        updateView(with: currentBasket)
    }
    
    func checkoutButtonPressed(item: ButtonItem) {
        
    }
    
    func updateView(with basket: BasketViewEntity) {
        let listItems = basket.transformToShoppingBasketList(view: .shoppingBasket)
        let buttonItem = basket.transformToProductListButtonItem(action: checkoutButtonPressed)
        state = .loaded(listItems, buttonItem)
    }
}
