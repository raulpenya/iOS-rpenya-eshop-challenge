//
//  ProductsApi.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation

enum ProductsApi: Api {
    case getAllProducts
    
    var method: HTTPMethod {
        switch self {
        case .getAllProducts:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .getAllProducts:
            return "https://gist.githubusercontent.com/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json"
        }
    }
    
    var headerParams: [String: Any] {
        switch self {
        case .getAllProducts:
            return [:]
        }
    }
    
    var bodyParams: Any {
        switch self {
        case .getAllProducts:
            return [:]
        }
    }
    
    var useCache: Bool {
        switch self {
        case .getAllProducts:
            return false
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .getAllProducts:
            return try createURLRequest()
        }
    }
}
