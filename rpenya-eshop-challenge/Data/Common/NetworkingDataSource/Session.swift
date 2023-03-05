//
//  Session.swift
//  Data
//
//  Created by raulbot on 5/3/23.
//

import Foundation

protocol Session {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

extension Session {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
        return dataTaskPublisher(for: request)
    }
}

extension URLSession: Session {}
