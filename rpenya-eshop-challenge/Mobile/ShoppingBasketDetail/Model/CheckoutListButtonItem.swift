//
//  CheckoutListButtonItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 10/3/23.
//

import Foundation

struct CheckoutListButtonItem: ButtonItem {
    var title: String
    var isDisabled: Bool
    var action: ((ButtonItem) -> Void)
}
