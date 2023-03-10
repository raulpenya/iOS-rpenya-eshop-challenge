//
//  ProductsListViewModelStateTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import XCTest
import Domain
@testable import rpenya_eshop_challenge

final class ProductsListViewModelStateTests: XCTestCase {
    func test_init_state() {
        //Given
        let model = ProductsListViewModel(getProductsWithPromotionsUseCase: MockGetProductsWithPromotions.getUseCase())
        //When
        let state = model.state
        //Then
        XCTAssertEqual(state, .idle)
    }
    
    func test_updateView_state() {
        //Given
        let model = ProductsListViewModel(getProductsWithPromotionsUseCase: MockGetProductsWithPromotions.getUseCase())
        let basket = MockBasketViewEntity.givenBasket()
        //When
        model.updateView(with: basket)
        //Then
        XCTAssertEqual(model.state, .loaded(basket.transformToProductsList(action: action), basket.transformToProductListButtonItem(action: buttonAction)))
    }
    
    func test_receiveError_state() {
        //Given
        let model = ProductsListViewModel(getProductsWithPromotionsUseCase: MockGetProductsWithPromotions.getUseCase())
        let error = NSError(domain: "MockGetProductsWithPromotions :: error", code: 0)
        //When
        model.receiveError(error)
        //Then
        XCTAssertEqual(model.state, .failed(error.transformToErrorDescription()))
    }
    
    func test_getProductsWithPromotions_state() {
        //Given
        let model = ProductsListViewModel(getProductsWithPromotionsUseCase: MockGetProductsWithPromotions.getUseCase())
        //When
        model.getProductsWithPromotions()
        //Then
        XCTAssertEqual(model.state, .loading)
    }
    
    func action(item: ProductsListItem, action: ProductsListItemAction) { }
    func buttonAction(item: ButtonItem) { }
}
