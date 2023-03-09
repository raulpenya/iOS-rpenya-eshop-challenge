//
//  ProductListButtonItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 9/3/23.
//

import Foundation

struct ProductsListButtonItem: ButtonItem {
    var title: String
    var isDisabled: Bool
    var action: ((ButtonItem) -> Void)
}
