//
//  ShoppingBasketDetailViewModelFlowTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 11/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ShoppingBasketDetailViewModelFlowTests: XCTestCase {
    func test_loadData_flow() {
        //Given
        let mockModel = MockShoppingBasketDetailViewModel.model
        //When
        mockModel.loadData()
        //Then
        XCTAssertTrue(mockModel.updateViewCalled)
    }
    
    func test_refreshData_flow() {
        //Given
        let mockModel = MockShoppingBasketDetailViewModel.model
        //When
        mockModel.refreshData()
        //Then
        XCTAssertTrue(mockModel.updateViewCalled)
    }
    
    func test_dismissAlertButtonPressed_flow() {
        //Given
        let mockModel = MockShoppingBasketDetailViewModel.model
        //When
        mockModel.checkoutButtonPressed(item: mockModel.currentShoppingBasket.transformToProductListButtonItem(action: mockModel.checkoutButtonPressed))
        //Then
        XCTAssertTrue(mockModel.dismissShoppingBasketDetail)
    }
    
    func test_delegate_flow() {
        //Given
        let delegate = MockShoppingBasketDetailDelegate()
        let mockModel = MockShoppingBasketDetailViewModel(currentShoppingBasket: MockShoppingBasketViewEntity.givenShoppingBasket(), delegate: delegate)
        //When
        mockModel.dismissAlertButtonPressed()
        //Then
        XCTAssertTrue(delegate.orderDidCompleteCalled)
    }
    
    func test_delegate_end_to_end_flow() {
        //Given
        let delegate = MockProductsListViewModel.model
        let mockModel = MockShoppingBasketDetailViewModel(currentShoppingBasket: MockShoppingBasketViewEntity.givenShoppingBasket(), delegate: delegate)
        //When
        mockModel.dismissAlertButtonPressed()
        //Then
        XCTAssertTrue(delegate.getProductsWithPromotionsCalled)
    }
}
