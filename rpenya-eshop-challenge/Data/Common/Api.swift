//
//  Api.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation

protocol Api {
    var method: HTTPMethod { get }
    var url: String { get }
    var headerParams: [String: Any] { get }
    var bodyParams: Any { get }
    var useCache: Bool { get }
    func asURLRequest() throws -> URLRequest
}

extension Api {
    func createURLRequest() throws -> URLRequest {
        guard let url = URL(string: url) else {
            throw NSError(domain: "DataErrors.urlFormat.localizedDescription",
                          code: 00000000000000,
                          userInfo: nil)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        if useCache { urlRequest.cachePolicy = .returnCacheDataElseLoad }
        
        headerParams.forEach { param in
            urlRequest.setValue("\(param.value)", forHTTPHeaderField: param.key)
        }
        if method == HTTPMethod.post {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParams, options: .prettyPrinted)
        }
        return urlRequest
    }
}
