//
//  MockProduct.swift
//  Domain
//
//  Created by raulbot on 5/3/23.
//

import Foundation
@testable import Domain

public struct MockProduct {
    public static func givenProduct() -> Product {
        return Product(code: "", name: "", price: 0)
    }
}
