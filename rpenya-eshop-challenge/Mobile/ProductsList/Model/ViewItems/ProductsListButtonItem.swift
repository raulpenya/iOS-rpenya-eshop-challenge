//
//  ProductListButtonItem.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 9/3/23.
//

import SwiftUI

struct ProductsListButtonItem: ButtonItem {
    var title: String
    var isDisabled: Bool
    var action: ((ButtonItem) -> Void)
    let price: String?
    let priceWithoutDiscount: String?
    
    func getTitle() -> AttributedString {
        if let price = price {
            if var rawPrice = priceWithoutDiscount, rawPrice != price {
                rawPrice = "\n(" + rawPrice + ")"
                let string = title + rawPrice + " " + price
                var attributedString = getAttributedString(with: string)
                if let range = attributedString.range(of: rawPrice) {
                    attributedString[range].strikethroughStyle = .single
                    attributedString[range].font = .headline.bold()
                }
                return attributedString
            } else {
                let string = title + "\n" + price
                return getAttributedString(with: string)
            }
        } else {
            return getAttributedString(with: title)
        }
    }
}
