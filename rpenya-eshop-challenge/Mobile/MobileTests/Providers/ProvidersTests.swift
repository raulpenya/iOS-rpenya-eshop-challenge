//
//  ProvidersTests.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 12/3/23.
//

import XCTest
@testable import rpenya_eshop_challenge

final class ProvidersTests: XCTestCase {
    // DUMMY test for PreviewProvider
    func test_productsListModelPreviewProvider() {
        XCTAssertNotNil(ProductsListModelPreviewProvider.getProductsListItem())
        XCTAssertNotNil(ProductsListModelPreviewProvider.anyItem1())
        XCTAssertNotNil(ProductsListModelPreviewProvider.anyItem2())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getProductsListItem1())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getProductsListItem2())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getBasket())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getBasketProduct1())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getBasket())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getBasketProduct1())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getBasketProduct2())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getProduct())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getProductWithoutPromotion())
        XCTAssertNotNil(ProductsListModelPreviewProvider.getPromotion())
    }
    
    func test_shoppingBasketModelPreviewProvider() {
        XCTAssertNotNil(ShoppingBasketModelPreviewProvider.getShoppingBasket())
    }
    
    func test_buttonItemModelPreviewProvider() {
        let item = ButtonItemModelPreviewProvider.getButtonItem()
        item.action(item)
        XCTAssertNotNil(item)
    }
}
