//
//  Products.swift
//  Domain
//
//  Created by raulbot on 7/3/23.
//

import Foundation

public struct Products {
    public let products: [Product]
    
    public init(products: [Product]) {
        self.products = products
    }
}

public extension Products {
    func removeDuplicates() -> Products {
        return Products(products: products.uniqued())
    }
}

extension Products {
    func linkPromotions(_ promotions: Promotions) -> Products {
        let newProducts = products.compactMap { product in
            var newProduct = product
            if let promotion = promotions.promotions.filter({ $0.productCode.lowercased() == product.code.lowercased() }).first {
                newProduct = product.addPromotion(promotion)
            }
            return newProduct
        }
        return Products(products: newProducts)
    }
}
