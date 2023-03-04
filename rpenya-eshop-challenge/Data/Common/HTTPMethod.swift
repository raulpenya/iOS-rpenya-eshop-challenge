//
//  HTTPMethod.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation

struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    static let get = HTTPMethod(rawValue: "GET")
    static let post = HTTPMethod(rawValue: "POST")
    static let put = HTTPMethod(rawValue: "PUT")
    static let delete = HTTPMethod(rawValue: "DELETE")
    let rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
