//
//  MockPromotion.swift
//  Domain
//
//  Created by raulbot on 6/3/23.
//

import Foundation
@testable import Domain

struct MockPromotion {
    static func givenPromotion() -> Promotion {
        return Promotion(productCode: "", name: "", type: .percentage, unitsNeeded: 2, discount: 0.50)
    }
}
