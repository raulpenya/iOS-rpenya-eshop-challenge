//
//  Resource.swift
//  Data
//
//  Created by raulbot on 4/3/23.
//

import Foundation

struct Resource<T: Decodable, Q> {
    let request: URLRequest
    let transform: (T) -> Q
}

protocol ResourceP {
    associatedtype T: Decodable
    associatedtype Q
    var request: URLRequest { get set }
    var transform: (T) -> Q { get set }
}
