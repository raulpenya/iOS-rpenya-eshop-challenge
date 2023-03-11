//
//  Double+Extensions.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 11/3/23.
//

import Foundation

extension Double {
    func toPriceString(with currency: String) -> String {
        return toPriceString()+currency
    }
    
    func toPriceString() -> String {
        return String(format: "%.2f", self)
    }
}
