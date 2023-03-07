//
//  Sequence+Extensions.swift
//  Domain
//
//  Created by raulbot on 7/3/23.
//

import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
