//
//  MockProduct.swift
//  Domain
//
//  Created by raulbot on 5/3/23.
//

import Foundation
@testable import Domain

struct MockProduct {
    static func givenProduct() -> Product {
        return Product(code: "", name: "", price: 0)
    }
}
