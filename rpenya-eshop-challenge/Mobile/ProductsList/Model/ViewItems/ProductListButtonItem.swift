//
//  ProductListButtonItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 9/3/23.
//

import Foundation

struct ProductListButtonItem: ButtonItem {
    var title: String
    var isDisabled: Bool
    var action: ((ButtonItem) -> Void)
}
