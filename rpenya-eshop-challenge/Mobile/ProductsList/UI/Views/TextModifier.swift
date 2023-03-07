//
//  TextModifier.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 7/3/23.
//

import SwiftUI

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.title3, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(1)
    }
}

struct SubtitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(.subheadline, weight: .regular))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 6)
            .lineLimit(2)
            .minimumScaleFactor(0.01)
    }
}
