//
//  CompleteButtonView.swift
//  rpenya-eshop-challenge
//
//  Created by raulbot on 7/3/23.
//

import SwiftUI

struct CompleteButtonView: View {
    
    let item: ButtonItem
    
    var body: some View {
        HStack {
            Button {
                item.action(item)
            } label: {
                Text(item.getTitle()).modifier(CompleteButtonTextModifier())
            }.frame(height: 70).frame(minWidth: 0, maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(item.isDisabled ? Colors.completeButtonDisabledBackgroundColor : Colors.completeButtonBackgroundColor)
                        .shadow(color: Colors.shadowColor, radius: 5)
                }.disabled(item.isDisabled)
        }.padding(.all, 20).frame(maxWidth: .infinity, alignment: .center).background(Color.white)
    }
}

struct CompleteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteButtonView(item: ButtonItemModelPreviewProvider.givenButtonItem())
    }
}
