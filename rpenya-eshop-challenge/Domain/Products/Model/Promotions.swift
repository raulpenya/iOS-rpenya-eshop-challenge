//
//  Promotions.swift
//  Domain
//
//  Created by raulbot on 7/3/23.
//

import Foundation

public struct Promotions {
    public let promotions: [Promotion]
    
    public init(promotions: [Promotion]) {
        self.promotions = promotions
    }
}

public extension Promotions {
    func removeDuplicates() -> Promotions {
        return Promotions(promotions: promotions.uniqued())
    }
}
