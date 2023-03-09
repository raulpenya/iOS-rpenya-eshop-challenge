//
//  MockProductsListItem.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

struct MockProductsListItem {
    static func givenProductsListItem1() -> ProductsListItem {
        return ProductsListItem(basketProduct: MockBasketProductViewEntity.givenBasketProduct1(), view: .productsList, action: nil)
    }
    
    static func givenProductsListItem2() -> ProductsListItem {
        return ProductsListItem(basketProduct: MockBasketProductViewEntity.givenBasketProduct2(), view: .productsList, action: nil)
    }
}
