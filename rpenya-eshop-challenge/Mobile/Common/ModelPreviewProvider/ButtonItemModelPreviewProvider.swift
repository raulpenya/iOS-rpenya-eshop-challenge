//
//  ButtonItemModelPreviewProvider.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 8/3/23.
//

#if DEBUG

import Foundation

struct ButtonItemModelPreviewProvider {
    static func givenButtonItem() -> ButtonItem {
        return ProductsListButtonItem(title: "_PreviewProvider_", isDisabled: true, action: { _ in
            print("ProductListButtonItem :: action")
        }, price: "200€", priceWithoutDiscount: "250€")
    }
}

#endif
