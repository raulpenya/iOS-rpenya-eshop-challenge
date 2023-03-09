//
//  ButtonItemModelPreviewProvider.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

import Foundation

struct ButtonItemModelPreviewProvider {
    static func givenButtonItem() -> ButtonItem {
        return ProductListButtonItem(title: "_PreviewProvider_", isDisabled: true) { item in
            print("ProductListButtonItem :: action")
        }
    }
}
