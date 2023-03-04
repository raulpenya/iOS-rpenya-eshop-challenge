//
//  ProductRemoteEntity.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation

//{
//  "products": [
//    {
//      "code": "VOUCHER",
//      "name": "Cabify Voucher",
//      "price": 5
//    },
//    {
//      "code": "TSHIRT",
//      "name": "Cabify T-Shirt",
//      "price": 20
//    },
//    {
//      "code": "MUG",
//      "name": "Cabify Coffee Mug",
//      "price": 7.5
//    }
//  ]
//}

struct ProductRemoteEntity: Decodable, Equatable {
    let code: String
    let name: String
    let price: Double
//    let currency: String = "€"
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.code == rhs.code
    }
}
