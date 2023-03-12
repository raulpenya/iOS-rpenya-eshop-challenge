//
//  PromotionsApi.swift
//  Data
//
//  Created by raulbot on 6/3/23.
//

import Foundation

enum PromotionsApi: Api {
    case getAllPromotions
    
    var method: HTTPMethod {
        switch self {
        case .getAllPromotions:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .getAllPromotions:
            return DataConstants.baseUrl + DataConstants.getPromotionsEndpoint
        }
    }
    
    var headerParams: [String: Any] {
        switch self {
        case .getAllPromotions:
            return [:]
        }
    }
    
    var useCache: Bool {
        switch self {
        case .getAllPromotions:
            return false
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .getAllPromotions:
            return try createURLRequest()
        }
    }
}
