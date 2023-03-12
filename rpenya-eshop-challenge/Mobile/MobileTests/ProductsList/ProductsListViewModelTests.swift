//
//  ProductsListViewModelTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ProductsListViewModelTests: XCTestCase {
    func test_transformToShoppingBasketDetailDependencies_success() {
        //Given
        let model = ProductsListViewModel(getProductsWithPromotionsUseCase: MockGetProductsWithPromotions.getUseCase())
        model.currentBasket = MockBasketViewEntity.givenBasket()
        //When
        let shoppingBasketDetailDependencies = model.transformToShoppingBasketDetailDependencies()
        //Then
        XCTAssertNotNil(shoppingBasketDetailDependencies)
        XCTAssertTrue(shoppingBasketDetailDependencies!.delegate is ProductsListViewModel)
    }

    func test_transformToShoppingBasketDetailDependencies_unsuccess() {
        //Given
        let model = ProductsListViewModel(getProductsWithPromotionsUseCase: MockGetProductsWithPromotions.getUseCase())
        model.currentBasket = BasketViewEntity(products: [MockBasketProductViewEntity.givenBasketProduct1(units: 0)], currency: "€")
        //When
        let shoppingBasketDetailDependencies = model.transformToShoppingBasketDetailDependencies()
        //Then
        XCTAssertNil(shoppingBasketDetailDependencies)
    }
}
