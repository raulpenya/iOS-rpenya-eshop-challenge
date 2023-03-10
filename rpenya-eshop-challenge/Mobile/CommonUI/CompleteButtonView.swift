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
                if let item = item as? ProductsListButtonItem {
                    Text(item.getTitle()).modifier(CompleteButtonTextModifier())
                } else {
                    Text(item.title).modifier(CompleteButtonTextModifier())
                }
            }.frame(height: 70).frame(minWidth: 0, maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(item.isDisabled ? Color(.systemGreen).opacity(0.2) : Color(.systemGreen))
                }.disabled(item.isDisabled)
        }.padding(.all, 20).frame(maxWidth: .infinity, alignment: .center).background(Color.white // any non-transparent background
            
//            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: -5)//.mask(Rectangle().padding(.top, -20))
          )
    }
}

struct CompleteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteButtonView(item: ButtonItemModelPreviewProvider.givenButtonItem())
    }
}
