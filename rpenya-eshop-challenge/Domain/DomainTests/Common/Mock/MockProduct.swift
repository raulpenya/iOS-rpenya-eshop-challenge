//
//  MockProduct.swift
//  Domain
//
//  Created by raulbot on 5/3/23.
//

import Foundation
@testable import Domain

struct MockProducts {
    static func givenProducts(duplicates: Bool = true) -> Products {
        if duplicates {
            return Products(products: [MockProduct.givenProduct1(), MockProduct.givenProduct2(), MockProduct.givenProduct3(), MockProduct.givenProduct2(), MockProduct.givenProduct1(), MockProduct.givenProduct2()])
        } else {
            return Products(products: [MockProduct.givenProduct1(), MockProduct.givenProduct2(), MockProduct.givenProduct3()])
        }
    }
}

struct MockProduct {
    static let code1 = "TSHIRT"
    static let name1 = "Cabify T-Shirt"
    static let price1 = 20.00
    
    static let code2 = "VOUCHER"
    static let name2 = "Cabify Voucher"
    static let price2 = 5.00
    
    static let code3 = "MUG"
    static let name3 = "Cabify Coffee Mug"
    static let price3 = 7.50
    
    static func givenProduct1() -> Product {
        return Product(code: code1, name: name1, price: price1, promotion: nil)
    }
    
    static func givenProduct2() -> Product {
        return Product(code: code2, name: name2, price: price2, promotion: nil)
    }
    
    static func givenProduct3() -> Product {
        return Product(code: code3, name: name3, price: price3, promotion: nil)
    }
}
