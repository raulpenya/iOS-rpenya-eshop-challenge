//
//  MockProductListItem.swift
//  rpenya-eshop-challengeTests
//
//  Created by raulbot on 8/3/23.
//

import Foundation
@testable import rpenya_eshop_challenge

struct MockProductListItem {
    static func givenProductListItem1() -> ProductListItem {
        return ProductListItem(basketProduct: MockBasketProductViewEntity.givenBasketProduct1(), view: .productsList, action: nil)
    }
    
    static func givenProductListItem2() -> ProductListItem {
        return ProductListItem(basketProduct: MockBasketProductViewEntity.givenBasketProduct2(), view: .productsList, action: nil)
    }
}
