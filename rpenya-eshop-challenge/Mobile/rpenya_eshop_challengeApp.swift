//
//  rpenya_eshop_challengeApp.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 4/3/23.
//

import SwiftUI

@main
struct rpenya_eshop_challengeApp: App {
    var body: some Scene {
        WindowGroup {
            ProductsListAssemblerInjection().resolve()
        }
    }
}
