//
//  MockShoppingBasketDetailViewModel.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

class MockShoppingBasketDetailDelegate: ShoppingBasketDetailDelegate {
    var orderDidCompleteCalled = false
    func orderDidComplete() {
        orderDidCompleteCalled = true
    }
}

class MockShoppingBasketDetailViewModel: ShoppingBasketDetailViewModel {
    var updateViewCalled = false
    
    static func getModel() -> MockShoppingBasketDetailViewModel {
        return MockShoppingBasketDetailViewModel(currentShoppingBasket: MockShoppingBasketViewEntity.givenShoppingBasket(), delegate: MockShoppingBasketDetailDelegate())
    }
    
    override func updateView(with shoppingBasket: ShoppingBasketViewEntity) {
        updateViewCalled = true
    }
}
