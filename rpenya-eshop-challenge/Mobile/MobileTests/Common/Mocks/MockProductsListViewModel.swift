//
//  MockProductsListViewModel.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

class MockProductsListViewModel: ProductsListViewModel {
    var getProductsWithPromotionsCalled = false
    var updateViewCalled = false
    
    static let model = MockProductsListViewModel(getProductsWithPromotionsUseCase: MockGetProductsWithPromotions.getUseCase())
    
    override func getProductsWithPromotions() {
        getProductsWithPromotionsCalled = true
    }
    
    override func updateView(with basket: BasketViewEntity) {
        updateViewCalled = true
    }
}
