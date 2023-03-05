//
//  String+Extensions.swift
//  Data
//
//  Created by raulbot on 5/3/23.
//

import Foundation
@testable import Data

extension String {
    static func getSuccessResponse() -> String {
        return "{\"products\":[{\"code\":\"VOUCHER\",\"name\":\"CabifyVoucher\",\"price\":5},{\"code\":\"TSHIRT\",\"name\":\"CabifyT-Shirt\",\"price\":20},{\"code\":\"MUG\",\"name\":\"CabifyCoffeeMug\",\"price\":7.5}]}"
    }
    
    static func getErrorResponse() -> String {
        return "404 Bad request"
    }
    
    static func getEmptyResponse() -> String {
        return ""
    }
}
