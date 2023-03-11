//
//  CustomButtonStyles.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 11/3/23.
//

import SwiftUI

//struct AddRemoveButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.frame(width: 50, height: 50).background {
//            RoundedRectangle(cornerRadius: 12.0)
//                .fill(Colors.addRemoveButtonBackgroundColor)
//        }
//    }
//}

struct AddRemoveButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title).modifier(AddRemoveButtonTextModifier())
        }.buttonStyle(BorderlessButtonStyle()).frame(width: 50, height: 50).background {
            RoundedRectangle(cornerRadius: 12.0)
                .fill(Colors.addRemoveButtonBackgroundColor)
        }
    }
}
