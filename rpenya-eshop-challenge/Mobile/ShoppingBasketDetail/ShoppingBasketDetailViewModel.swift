//
//  ShoppingBasketDetailViewModel.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import Foundation

protocol ShoppingBasketDetailDelegate: AnyObject {
    func orderDidComplete()
}

class ShoppingBasketDetailViewModel: ObservableObject {
    @Published private(set) var state = State.idle
    @Published var dismissShoppingBasketDetail: Bool = false
    let currentShoppingBasket: ShoppingBasketViewEntity
    weak var delegate: ShoppingBasketDetailDelegate?
    
    init(state: State = State.idle, currentShoppingBasket: ShoppingBasketViewEntity, delegate: ShoppingBasketDetailDelegate) {
        self.state = state
        self.currentShoppingBasket = currentShoppingBasket
        self.delegate = delegate
    }
    
    func loadData() {
        updateView(with: currentShoppingBasket)
    }
    
    func checkoutButtonPressed(item: ButtonItem) {
        dismissShoppingBasketDetail = true
    }
    
    func dismissAlertButtonPressed() {
        delegate?.orderDidComplete()
    }
    
    func updateView(with shoppingBasket: ShoppingBasketViewEntity) {
        let listItems = shoppingBasket.transformToShoppingBasketList(view: .shoppingBasket)
        let buttonItem = shoppingBasket.transformToProductListButtonItem(action: checkoutButtonPressed)
        state = .loaded(listItems, buttonItem)
    }
}
