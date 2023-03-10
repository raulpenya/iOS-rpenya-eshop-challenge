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
                var attributedString = AttributedString(string)
                attributedString.font = .title.bold()
                attributedString.foregroundColor = .white
                if let range = attributedString.range(of: rawPrice) {
                    attributedString[range].strikethroughStyle = .single
                    attributedString[range].font = .headline.bold()
                }
                return attributedString
            } else {
                let string = title + "\n" + price
                var attributedString = AttributedString(string)
                attributedString.font = .title.bold()
                attributedString.foregroundColor = .white
                return attributedString
            }
        } else {
            return getAttributedString(with: title)
        }
    }
}
