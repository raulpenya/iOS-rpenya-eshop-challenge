//
//  ProductsListViewModelGetProductsTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 10/3/23.
//

import XCTest
import Domain
@testable import rpenya_eshop_challenge

final class ProductsListViewModelFlowTests: XCTestCase {
    func test_loadData_flow() {
        //Given
        let mockModel = MockProductsListViewModel.getModel()
        //When
        mockModel.loadData()
        //Then
        XCTAssertTrue(mockModel.getProductsWithPromotionsCalled)
    }
    
    func test_refreshData_flow() {
        //Given
        let mockModel = MockProductsListViewModel.getModel()
        //When
        mockModel.refreshData()
        //Then
        XCTAssertTrue(mockModel.getProductsWithPromotionsCalled)
    }
    
    func test_receiveResult_flow() {
        //Given
        let mockModel = MockProductsListViewModel.getModel()
        let products = MockProducts.givenProducts(duplicates: false)
        //When
        mockModel.receiveResult(products)
        //Then
        XCTAssertTrue(mockModel.updateViewCalled)
    }
    
    func test_productsListItemButtonPressed_add_flow() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        let mockModel = MockProductsListViewModel.getModel()
        mockModel.currentBasket = basket
        let item = MockBasketProductViewEntity.givenBasketProduct1().transformToProductsListItem(action: mockModel.productsListItemButtonPressed)
        //When
        mockModel.productsListItemButtonPressed(item: item as! ProductsListItem, action: .add)
        //Then
        XCTAssertTrue(mockModel.updateViewCalled)
    }
    
    func test_productsListItemButtonPressed_remove_flow() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        let mockModel = MockProductsListViewModel.getModel()
        mockModel.currentBasket = basket
        let item = MockBasketProductViewEntity.givenBasketProduct1().transformToProductsListItem(action: mockModel.productsListItemButtonPressed)
        //When
        mockModel.productsListItemButtonPressed(item: item as! ProductsListItem, action: .remove)
        //Then
        XCTAssertTrue(mockModel.updateViewCalled)
    }
    
    func test_checkoutButtonPressed_success_flow() {
        //Given
        let basket = MockBasketViewEntity.givenBasket()
        let mockModel = MockProductsListViewModel.getModel()
        mockModel.currentBasket = basket
        //When
        mockModel.checkoutButtonPressed(item: basket.transformToProductListButtonItem(action: mockModel.checkoutButtonPressed))
        //Then
        XCTAssertTrue(mockModel.presentShoppingBasketDetail)
    }
    
    func test_checkoutButtonPressed_unsuccess_flow() {
        //Given
        let basket = BasketViewEntity(products: [MockBasketProductViewEntity.givenBasketProduct1(units: 0), MockBasketProductViewEntity.givenBasketProduct2(units: 0)], currency: MockBasketViewEntity.currency)
        let mockModel = MockProductsListViewModel.getModel()
        mockModel.currentBasket = basket
        //When
        mockModel.checkoutButtonPressed(item: basket.transformToProductListButtonItem(action: mockModel.checkoutButtonPressed))
        //Then
        XCTAssertFalse(mockModel.presentShoppingBasketDetail)
    }
}
