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
            return DataConstants.baseUrl + DataConstants.getProductsEndpoint
        }
    }
    
    var headerParams: [String: Any] {
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
